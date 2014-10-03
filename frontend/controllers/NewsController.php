<?php

namespace frontend\controllers;

use common\models\Gallery;
use common\models\Images;
use common\models\User;
use common\models\Like;
use common\models\News;
use yii\rest\ActiveController;

class NewsController extends ActiveController
{
     public $modelClass = 'common\models\News';
    /**
     * @inheritdoc
     */
    public function actions()
    {
        $actions = parent::actions();

        // disable the "index"
        unset($actions['view'], $actions['index']);
        return $actions;
    }

    public function actionIndex()
    {
        

        $news = News::find()
                    ->where(['status' => News::VERIFIED, 'is_published' => News::PUBLISHED, 'visibility' => News::VISIBLE])
                    ->orderBy('id desc')
                    ->limit(10)
                    ->all();
        $array = [];
        if (isset($news))
        {
            foreach($news as $key => $new)
            {
                $array[$key] = $new->attributes;
            }
        }

        echo json_encode(['News' => $array]);
    }

    public function actionView($id=null)
    {

        $news = News::find()
                ->where(['id' => $id, 'status' => News::VERIFIED, 'is_published' => News::PUBLISHED, 'visibility' => News::VISIBLE])
                ->one();
        if (isset($news))
            echo json_encode(['News' => $news->attributes]);
        else
            echo json_encode(['News' => []]);
        exit();
       
    }

}



