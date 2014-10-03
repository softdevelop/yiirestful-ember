<?php
namespace frontend\controllers;

use Yii;
use yii\rest\ActiveController;
use common\models\Userprofile;

/**
 * Site controller
 */
class GamificationController extends ActiveController
{
    public $modelClass = 'common\models\Gamification';
    /**
     * @inheritdoc
     */
    public function actions()
    {
        $actions = parent::actions();

        // disable the "index"
        unset($actions['view']);
        return $actions;
    }

    /**
     * show all gamifications  of specified user
     * @param  $id of user
     * @return json gamifications 
     */
    public function actionView()
    {
        if(isset($_GET['sd_users_id']))
        {
            $sd_users_id = $_GET['sd_users_id'];
            $profile = Userprofile::find()
                ->where(['sd_users_id' => $sd_users_id])->one();       

            if (!empty($profile->gamifications))
            {
                foreach ($profile->gamifications as $key => $gamification)
                {
                    $gamificationArr[] = $gamification->attributes;
                }
            }

            echo json_encode(['Gamification' => $gamificationArr]);
        }
    }

    
}
