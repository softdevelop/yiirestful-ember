<?php
namespace frontend\controllers;

use Yii;
use yii\rest\ActiveController;
use common\models\UserBoycottCreates;
use common\models\Userprofile;
use common\models\BoyCotts;

/**
 * Site controller
 */
class BoycottcreatedsController extends ActiveController
{
    public $modelClass = 'common\models\UserBoycottCreates';
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
        if (isset($_GET['sd_users_id'])) 
        {
            $profile =  Userprofile::find()
                            ->where(['sd_users_id' => $_GET['sd_users_id']])->one();
            if (isset($profile))
            {
                $boyCottCreates = UserBoycottCreates::find()
                                ->where(['sd_userprofiles_id' => $profile->id])->all(); 

                $userBoycottCreate_Arr = [];
                if (!empty($boyCottCreates))
                {
                    foreach ($boyCottCreates as $key => $boyCottCreate)
                    {
                        $boycott = BoyCotts::find()
                                        ->where(['id'=> $boyCottCreate['sd_boycotts_id']])
                                        ->one();
                        $userBoycottCreate_Arr[$key] = $boycott->attributes;
                        if (is_object($boyCottCreate->sdBoycotts->sdProducts))
                            $userBoycottCreate_Arr[$key]['product'] = $boyCottCreate->sdBoycotts->sdProducts->id;
                    }
                }
                echo json_encode(['Boycottcreated' => $userBoycottCreate_Arr]);
            }
        } 
    }
}
