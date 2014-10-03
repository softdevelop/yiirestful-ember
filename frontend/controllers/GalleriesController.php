<?php

namespace frontend\controllers;

use yii\rest\ActiveController;
use common\models\Galleries;
use common\models\Images;
use common\models\User;
use common\models\Like;

class GalleriesController extends ActiveController
{
     public $modelClass = 'common\models\Galleries';

    public function actions()
    {
        $actions = parent::actions();

        // disable the "index" and "create" actions
        unset($actions['index'], $actions['create'], $actions['update'], $actions['delete']);
        return $actions;
    }

    public function actionIndex()
    {

        $imagesDetails = [];
        $galleriesDetails = []; 
        $galleries = Galleries::find()
                            ->where(['status' => Galleries::VERIFIED, 'visibility' => Galleries::VISIBLE])
                            ->all();
        foreach ($galleries as $key => $gallery) 
        {
            $galleriesDetails[$key] = $gallery->attributes;
            $galleriesDetails[$key] = array_merge($galleriesDetails[$key], ['images' => $this->_getIdImage($gallery->images)]);
            $galleriesDetails[$key] = array_merge($galleriesDetails[$key], ['owner' => $this->_getOwnerInfo($gallery->owner)]);
            $galleriesDetails[$key] = array_merge($galleriesDetails[$key], ['like' => $this->_countLikes($gallery->owner, 'gallery')]);

            $images = Images::find()
                                    ->where(['sd_galleries_id' => $gallery->id])
                                    ->all();
            
            foreach ($images as $key => $image) 
            {
                if (is_object($image))
                    $imagesDetails[] = $image->attributes;
            }
        }

        $jsonArr = ['Gallery' => $galleriesDetails, 'images' =>$imagesDetails];
        echo json_encode($jsonArr);
    }

    private function _getIdImage($images = null)
    {   
        $imageIds = [];
        foreach ($images as $key => $image) 
        {
            $imageIds[] = $image->id;             
        }
        return $imageIds;
    }

    private function _getOwnerInfo($owner_id = null)
    {
        $user = User::findOne($owner_id);
        return $user->id;
    }

    private function _countLikes($user_id, $target_type = '')
    {
        $like = Like::find()
                    ->where(['sd_users_id' => $user_id, 'target_type' => $target_type])
                    ->all();
        return count($like);
    }

    /**
     * 
     */
    public function actionCreate($id = null)
    {
        $putData = get_object_vars(json_decode(file_get_contents("php://input")));
        $data = $putData['gallery']; 

        $gallery = new \common\models\Galleries;
        $gallery->title = $data->title;
        $gallery->description = $data->description;
        $gallery->owner = $data->owner;
        $gallery->status = 1;
        $gallery->visibility = 1;
        if ($gallery->validate()) {
            $gallery->save();
            echo json_encode(['Gallery' => $gallery->attributes]);
        } else {
            $arr = ['error' => true, 'message' => $gallery->getErrors()];
            echo json_encode($arr);
        }              
    }

    /**
     * 
     */
    public function actionUpdate($id = null)
    {
        $putData = get_object_vars(json_decode(file_get_contents("php://input")));
        $data = $putData['gallery']; 

        $gallery = Galleries::find()
                        ->where(['id' => $id])
                        ->one();
        $gallery->title         =   $data->title;
        $gallery->description   =   $data->description;
        $gallery->save();

        echo json_encode(['Gallery' => $gallery->attributes]);                 
    }

     /**
     * 
     */
    public function actionDelete($id = null)
    {
        $gallery = Galleries::find()
                        ->where(['id' => $id])
                        ->one();
        $gallery->status        =   Galleries::UNVERIFIED;
        $gallery->visibility    =   Galleries::INVISIBLE;
        $gallery->save();

        echo json_encode(['Gallery' => $gallery->attributes]);                 
    }


}
