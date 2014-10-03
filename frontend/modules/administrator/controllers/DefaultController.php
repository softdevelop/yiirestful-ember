<?php

namespace app\modules\administrator\controllers;

use yii\web\Controller;

class DefaultController extends BasicController
{
    public function actionIndex()
    {
        return $this->render('index');
    }
}

