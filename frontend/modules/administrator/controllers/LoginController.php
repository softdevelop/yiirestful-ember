<?php

namespace app\modules\administrator\controllers;

use yii\web\Controller;
use yii\filters\AccessControl;
use common\models\LoginForm;

class LoginController extends BasicController
{
	// set layout only this controller
	public $layout = 'login';

	/**
	 * behaviors method
	 * @return array access control filter
	 */
	public function behaviors()
    {    	
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'allow' => true,
                        'actions' => ['index'],
                        'roles' => ['?'],
                    ],
                    [
                        'allow' => true,
                        'actions' => ['index'],
                        'roles' => ['@'],
                    ],
                ],
            ],
        ];
    }

    public function actionIndex()
    {
       
    	if (!\Yii::$app->user->isGuest) {
            return $this->redirect('/admin');
        }

        $model = new LoginForm();
        if ($model->load(\Yii::$app->request->post()) && $model->login()) {
            return $this->redirect('/admin');
        } else {
            return $this->render('index',['model'=>$model]);
        }
    }


}
