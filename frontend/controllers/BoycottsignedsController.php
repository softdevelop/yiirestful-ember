<?php
namespace frontend\controllers;

use Yii;
use yii\rest\ActiveController;
use common\models\UserBoycottSigns;
use common\models\Userprofile;
use common\models\BoyCotts;

/**
 * Site controller
 */
class BoycottsignedsController extends ActiveController
{
    public $modelClass = 'common\models\UserBoycottSigns';
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

    /**
     * show all gamifications  of specified user
     * @param  $id of user
     * @return json gamifications 
     */
    public function actionIndex()
    {
        if(isset($_GET['sd_users_id']))
        {
            $sd_users_id = $_GET['sd_users_id'];
            $profile =  Userprofile::find()
                ->where(['sd_users_id' => $sd_users_id])->one();  
            $boyCottSigns = UserBoycottSigns::find()
                ->where(['sd_userprofiles_id' => $profile->id])->all(); 

            $userBoycottSign_Arr = [];
            if (!empty($boyCottSigns))
            {
                foreach ($boyCottSigns as $key => $boyCottSign)
                {
                    $boycott = BoyCotts::find()
                                        ->where(['id'=> $boyCottSign['sd_boycotts_id']])
                                        ->one();
                    $userBoycottSign_Arr[$key] = $boycott->attributes;
                    $userBoycottSign_Arr[$key]['money_spend'] = $boyCottSign['money_spend'];
                    if (isset($boyCottSign->sdBoycotts->sdProducts))
                        $userBoycottSign_Arr[$key]['product'] = $boyCottSign->sdBoycotts->sdProducts->id;
                }
            }
            echo json_encode(['Boycottsigned' => $userBoycottSign_Arr]);
        }
    }
}
