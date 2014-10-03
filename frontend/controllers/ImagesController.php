<?php

namespace frontend\controllers;

use yii\rest\ActiveController;
use common\models\Galleries;
use common\models\Images;
use common\models\User;
use common\models\Like;
use yii\web\Controller;


class ImagesController extends ActiveController
{
    public $modelClass = 'common\models\Images';
	public function actions()
    {
        $actions = parent::actions();

        // disable the "index" and "create" actions
        unset($actions['index'], $actions['create'], $actions['update'], $actions['delete']);
        return $actions;
    }

    public function actionIndex()
    {
        if(isset($_GET['sd_galleries_id']))
        {
            $images = Images::find()
                        ->where(['status' => Images::VERIFIED, 'visibility' => Images::VISIBLE, 'sd_galleries_id' => $_GET['sd_galleries_id']])
                        ->all();
        }
        else
        {
            $images = Images::find()
                        ->where(['status' => Images::VERIFIED, 'visibility' => Images::VISIBLE])
                        ->all();
        }

        if (isset($images))
        {
            $imagesDetails = [];
            foreach ($images as $key => $image) 
            {
                $imagesDetails[$key] = $image->attributes;
                $imagesDetails[$key] = array_merge($imagesDetails[$key], ['owner' => $this->_getOwnerInfo($image->owner)]);
                $imagesDetails[$key] = array_merge($imagesDetails[$key], ['like' => $this->_countLikes($image->owner, 'image')]);
            }
            echo json_encode(['Image' => $imagesDetails]);
        }
        
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
    * Multi file upload example
    * @author Resalat Haque
    * @link http://www.w3bees.com/2013/02/multiple-file-upload-with-php.html
    **/
    public function actionUpload()
    {

        $result = [];
        if (!empty($_FILES)) {
            $name = $_FILES['file']['name'];
            $savedname = time() . '_' . $name;
            $message_uploaded_return = $this->_move_images($savedname);
            if (!empty($message_uploaded_return)) // have some errors during upload
            {
                $result = ['error' => true, 'message' => $message_uploaded_return];
            }
            else
            {
                $result = ['error' => false, 'url' => 'img/galleries/' . $savedname];
            }
        }
        echo json_encode($result);
    }

    private function _move_images($savedname)
    {
        $valid_formats = array("jpg", "png", "gif");
        $max_file_size = 1024*5000; //5000 kb
        $path          = dirname(__DIR__) . '/web/img/galleries/'; // Upload directory
        $message       = '';

        // Loop $_FILES to execute all files
            $name = $_FILES['file']['name'];
            if ($_FILES['file']['error'] == 4) {
                continue; // Skip file if any error found
            }          
            if ($_FILES['file']['error'] == 0) {              
                if ($_FILES['file']['size']> $max_file_size) {
                    $message = "$name is too large!.";
                    continue; // Skip large files
                }
                elseif( ! in_array(pathinfo($name, PATHINFO_EXTENSION), $valid_formats) ){
                    $message = "$name is not a valid format";
                    continue; // Skip invalid file formats
                }
                else
                { // No error found! Move uploaded files 
                    if(move_uploaded_file($_FILES["file"]["tmp_name"], $path.$savedname)) 
                    {
                    }
                }
            }
        return $message;
    }

    /**
     * 
     */
    public function actionCreate($id = null)
    {
        $putData = get_object_vars(json_decode(file_get_contents("php://input")));
        $data = $putData['image']; 

        $image = new \common\models\Images;
        $image->title = $data->title;
        $image->description = $data->description;
        $image->owner = $data->owner;
        $image->sd_galleries_id = $data->sd_galleries_id;
        $image->url = $data->url;
        $image->status = 1;
        $image->visibility = 1;
        if ($image->validate()) {
            $image->save();
            echo json_encode(['Image' => $image->attributes]);
        } else {
            $arr = ['error' => true, 'message' => $image->getErrors()];
            echo json_encode($arr);
        }              
    }

    /**
     * 
     */
    public function actionUpdate($id = null)
    {
        $putData = get_object_vars(json_decode(file_get_contents("php://input")));
        $data = $putData['image']; 

        $image = Images::find()
                        ->where(['id' => $id])
                        ->one();
        $image->title         =   $data->title;
        $image->description   =   $data->description;
        $image->save();

        echo json_encode(['Image' => $image->attributes]);                 
    }

     /**
     * 
     */
    public function actionDelete($id = null)
    {
        $image = Images::find()
                        ->where(['id' => $id])
                        ->one();
        $image->status        =   Images::UNVERIFIED;
        $image->visibility    =   Images::INVISIBLE;
        $image->save();

        echo json_encode(['Image' => $image->attributes]);                 
    }

}
