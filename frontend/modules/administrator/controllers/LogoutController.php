<?php

namespace app\modules\administrator\controllers;

use yii\web\Controller;
use yii\filters\AccessControl;

class LogoutController extends BasicController
{
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
                        'roles' => ['@'],
                    ],
                ],
            ],
        ];
    }

    public function actionIndex()
    {
        \Yii::$app->user->logout();
        return $this->redirect('/admin/login');
    }


}
