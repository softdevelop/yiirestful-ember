<?php

namespace frontend\controllers;

use yii\rest\ActiveController;
use yii\helpers\ArrayHelper;
use yii\helpers\Security;
use yii\filters\auth\HttpBearerAuth;
use yii\filters\auth\QueryParamAuth;
use common\models\Userprofile;
use yii\web\Controller;

class UserprofileController extends Controller
{
    public $modelClass = 'common\models\Userprofile';

	public function actions()
	{
	    $actions = parent::actions();

	    // disable the "index" and "create" actions
	    unset($actions['index'], $actions['update']);
	    return $actions;
	}

    public function actionIndex()
    {
        if(isset($_GET['sd_users_id']))
        {
            $sd_users_id = $_GET['sd_users_id'];

            $users = Userprofile::find()
                        ->where(['sd_users_id' => $sd_users_id])
                        ->orderBy('id')
                        ->asArray()
                        ->all();

            $arr = ['Userprofile' => $users];
            echo json_encode($arr);
        }
        else
        {
             $users = Userprofile::find()
                        ->orderBy('id')
                        ->asArray()
                        ->all();

            $arr = ['Userprofile' => $users];
            echo json_encode($arr);
        }
    }

    /**
     * 
     */
    public function actionUpdate($id = null)
    {
        $putData = get_object_vars(json_decode(file_get_contents("php://input")));
        $user = Userprofile::find()
                        ->where(['sd_users_id' => $id])
                        ->orderBy('id')
                        ->one();
        $profile        = $putData['userprofile'];
        $user->name     =   $profile->name;
        $user->surname  =   $profile->surname;
        $user->birthday =   $profile->birthday;
        $user->bio      =   $profile->bio;
        $user->comment  =   $profile->comment;
        $user->save();    

        echo json_encode(['Userprofile' => $user->attributes]);                  
    }

    public function actionPicture()
    {   
        $arr_return = [];
        if(empty($_FILES['file']['tmp_name']) || $_FILES['file']['tmp_name'] == 'none')
        {
            $arr_return['errors'] = 'No file was uploaded..';
        }
        else 
        {
                
                $model_userprofile = Userprofile::findOne($_POST['id']);
                if (isset($model_userprofile))
                {
                    //1. move imges to directory
                    $message_uploaded = $this->_move_images($model_userprofile);
                    if (!empty($message_uploaded))
                    {
                        $arr_return['errors'] = $message_uploaded;
                    }
                    else
                    {
                        //2. save to db
                        $model_userprofile->save();
                        $arr_return = $model_userprofile->attributes;
                        $arr_return = array_merge($arr_return, ['errors' => '']);
                        $arr_return = array_merge($arr_return, ['path_uploaded' => $model_userprofile->path_uploaded]);
                    }
                    
                }
                @unlink($_FILES['file']);       
        } 
        echo  json_encode(['Userprofile' => $arr_return]);
    }

    private function _move_images($model)
    {
        $valid_formats = array("jpg", "png", "gif");
        $max_file_size = 1024*5000; //5000 kb
        $path          = dirname(__DIR__) . '/web/img/userprofile/'; // Upload directory
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
                    $name = time() . '_' . $name;
                    if(move_uploaded_file($_FILES["file"]["tmp_name"], $path.$name)) 
                    {
                        $model->profile_picture = \Yii::$app->homeUrl . 'img/userprofile/' . $name;
                    }
                }
            }
        return $message;
    }
}