<?php
namespace frontend\controllers;

use yii\rest\ActiveController;
use yii\helpers\ArrayHelper;
use yii\helpers\Security;
use yii\filters\auth\HttpBearerAuth;
use yii\filters\auth\QueryParamAuth;

/**
 * Profile controller
 */
class ProfileController extends ActiveController
{
    public $modelClass = 'common\models\Userprofile';

    public function actions()
    {
        $actions = parent::actions();

        // disable the "index" and "create" actions
        unset($actions['index']);
        return $actions;
    }

    public function actionIndex()
    {
        // url http://restadvancelocal.com/profiles?sd_users_id=1
        $sd_users_id = $_GET['sd_users_id'];
        //$arr = ['Profile' => ["id" => 1, "name" => "myname", "surname" => "Dao"], "User" => ["id" => 1, "username" => "vietdao"]];
        $arr = ['Profile' => [["id" => 1, "name" => "myname", "surname" => "Dao", "birthday" => "2014", "profile_picture" => "/img/profile.png","comment" => "my comment", "total" => 10, "user" => 1]]];
        echo json_encode($arr);
    }

}  
?>