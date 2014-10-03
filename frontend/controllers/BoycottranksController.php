<?php

namespace frontend\controllers;
use yii\rest\ActiveController;
use common\models\BoyCotts;


class BoycottranksController extends ActiveController
{
	public $modelClass = "common\models\BoyCotts";
	/**
	 * @inheritdoc
	 */
	public function actions()
	{
		$actions = parent::actions();

		// disable the "index"
        unset($actions['index']);
        return $actions;
	}


    public function actionIndex()
    {
    	$model_boycotts_ranks = BoyCotts::find()
    							->limit(10)
    							->orderBy('id desc')
								->all();
		
        $json_arr_return = [];
        if (!empty($model_boycotts_ranks))
        {
        	foreach ($model_boycotts_ranks as $key => $boycott) {
				$json_arr_return[$key] = $boycott->attributes;
				// push appropriate product infomations to array return
				if(is_object($boycott->sdProducts))
					$json_arr_return[$key]['product']   = $boycott->sdProducts->attributes;
				if(is_object($boycott->sdUsers))   		
					$json_arr_return[$key]['user']   = $boycott->sdUsers->attributes;

        	}
        }
        echo json_encode(['Boycottrank' => $json_arr_return]);
    }

}
