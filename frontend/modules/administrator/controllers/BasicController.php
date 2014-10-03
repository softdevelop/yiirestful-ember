<?php

namespace app\modules\administrator\controllers;

use yii\filters\AccessControl;
use yii\web\Controller;

class BasicController extends \yii\web\Controller
{
    public $layout = 'admin-main';
    public $role;

    /**
     * init method
     * @return avoid
     */
    public function init()
    {
    	parent::init();
    	$this->role = \Yii::$app->user->can('full');
    }

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
                        'roles' => ['full'],
                    ],
                ],
            ],
        ];
    }

}
