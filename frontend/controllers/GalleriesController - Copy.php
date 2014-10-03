<?php

namespace frontend\controllers;

use common\models\Gallery;
use common\models\Images;
use common\models\User;
use common\models\Like;

class GalleriesController extends \yii\web\Controller
{
    public function actionIndex()
    {
        $galleries = Gallery::find()
                            ->where(['status' => Gallery::VERIFIED, 'visibility' => Gallery::VISIBLE])
                            ->all();
        foreach ($galleries as $key => $gallery) 
        {
            $galleriesDetails[$key] = $gallery->attributes;
            $galleriesDetails[$key] = array_merge($galleriesDetails[$key], ['image' => $this->_getIdImage($gallery->images)]);
            $galleriesDetails[$key] = array_merge($galleriesDetails[$key], ['owner' => $this->_getOwnerInfo($gallery->owner)]);
            $galleriesDetails[$key] = array_merge($galleriesDetails[$key], ['like' => $this->_countLikes($gallery->owner, 'gallery')]);

            $images = Images::find()
                                    ->where(['id' => $gallery->id])
                                    ->all();
            foreach ($images as $key => $image) 
            {
                if (is_object($image))
                    $imagesDetails[] = $image->attributes;
            }
        }

        $jsonArr = ['Gallery' => $galleriesDetails, 'Image' =>$imagesDetails];
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
        return $user->attributes;
    }

    private function _countLikes($user_id, $target_type = '')
    {
        $like = Like::find()
                    ->where(['sd_users_id' => $user_id, 'target_type' => $target_type])
                    ->all();
        return count($like);
    }

    public function actionCreate()
    {

    }
    public function actionUpdate()
    {

    }
    public function actionView()
    {
    	
    }

}
