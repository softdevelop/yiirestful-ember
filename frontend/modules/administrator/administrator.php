<?php

namespace app\modules\administrator;

class administrator extends \yii\base\Module
{
    public $controllerNamespace = 'app\modules\administrator\controllers';

    public function init()
    {
        parent::init();
        \Yii::$app->set('user', [
              'class'           => 'yii\web\User',
              'identityClass'   => 'common\models\User',
              'enableAutoLogin' => true,
              'loginUrl'        => ['admin/login'],
                   
		    ]);
        // custom initialization code goes here
    }
}
