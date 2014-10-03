<?php

namespace frontend\controllers;

class CompaniesController extends \yii\web\Controller
{
    public function actionIndex()
    {
        return $this->render('index');
    }

}
