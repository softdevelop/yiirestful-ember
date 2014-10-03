<?php
namespace frontend\controllers;

use Yii;
use yii\rest\ActiveController;
use common\models\Userprofile;

/**
 * Site controller
 */
class BadgesAndChallengesController extends ActiveController
{
    public $modelClass = 'common\models\BadgesAndChallenges';
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
    public function actionView($id = null)
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
                    $badges_and_challengesArr[] = $gamification->sdBadgesAndChallenges->attributes;
                }
            }

            echo json_encode(['Badgesandchallenge' => $badges_and_challengesArr]);
        }
    }

    
}
