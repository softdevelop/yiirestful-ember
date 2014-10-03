<?php
namespace frontend\controllers;

use Yii;
use yii\base\InvalidParamException;
use yii\web\BadRequestHttpException;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;

/**
 * Site controller
 */
class LoginController extends Controller
{
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    public function actionIndex()
    {
        $user = new \common\models\LoginForm;
        $data = ["LoginForm"=> [ 
                    "username"=>$_POST['username'],
					"password"=>$_POST['password'],
                    "rememberMe"=>1
                ]];
                
        if ($user->load($data) && $user->login()) {
            $arr = ['message'=> 'Register successfully!',  'api_key'=> ['access_token'=> $user['User']['access_token'], 'user_id'=> $user['User']['id']]];
            echo json_encode($arr);
        } else {
            $arr = ['error' => true, 'message' => $user->getErrors()];
            echo json_encode($arr);
        }
        exit;
    }
}  
?>