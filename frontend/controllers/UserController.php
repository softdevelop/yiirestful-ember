<?php

namespace frontend\controllers;

use yii\rest\ActiveController;
use yii\helpers\ArrayHelper;
use yii\helpers\Security;
use yii\filters\auth\HttpBearerAuth;
use yii\filters\auth\QueryParamAuth;
use common\models\User;

class UserController extends ActiveController
{
    public $modelClass = 'common\models\User';

    // authentication
    /*
    public function behaviors()
	{
	    return ArrayHelper::merge(parent::behaviors(), [
	        'authenticator' => [
	            'class' => HttpBearerAuth::className(),
	        ],
	    ]);
	}
	*/

	public function actions()
	{
	    $actions = parent::actions();
	    // disable the "delete" and "create" actions
	    unset($actions['delete'], $actions['create'], $actions['index'], $actions['view']);
	    return $actions;
	}

    /**
     * show all users informations
     * @param  avoid
     * @return json to contain all infors of all user
     */
    public function actionIndex()
    {
        $usersInfors = User::find()->all();
        $jsonArr = $this->getInforsRelation($usersInfors, true);
        echo json_encode($jsonArr);
    }

    /**
     * show a specified user informations
     * @param  int $id
     * @return json to contain all infor of specified user
     */
    public function actionView($id)
    {
        $userInfors = User::findOne($id);
        echo json_encode($this->getInforsRelation($userInfors));
    }


    /**
     * retreive all relative infors of a user
     * @param  user
     * @return array
     */
    private function getInforsRelation($userInfors, $listUser = false)
    {
        $gamification_Id_Arr = $gamification_Info_Arr = $badgeandchallenge_Id_Arr = $badgeandchallenge_Info_Arr = [];
        if ($listUser)
        {
            foreach ($userInfors as $key => $userInfor) 
            {
                foreach ($userInfor->userprofiles->gamifications as $key => $gamification) 
                {
                    $gamification_Id_Arr[]        = $gamification->id;
                    $gamification_Info_Arr[]      = $gamification->attributes;
                    $badgeandchallenge_Id_Arr[]   = $gamification->sdBadgesAndChallenges->id;
                    $badgeandchallenge_Info_Arr[] = $gamification->sdBadgesAndChallenges->attributes;
                }
                // retreive user
                $user_Arr[] = [
                    'profile'            => $userInfor->userprofiles->id, 
                    'gamifications'      => $gamification_Id_Arr,
                    'badgeandchallenges' => $badgeandchallenge_Id_Arr
                ];    
                $userInfoAttr[] = $userInfor->attributes;
            }
            $user_Arr = array_merge($userInfoAttr, $user_Arr);
        }
        else
        {
            foreach ($userInfors->userprofiles->gamifications as $key => $gamification) 
            {
                $gamification_Id_Arr[]        = $gamification->id;
                $gamification_Info_Arr[]      = $gamification->attributes;
                $badgeandchallenge_Id_Arr[]   = $gamification->sdBadgesAndChallenges->id;
                $badgeandchallenge_Info_Arr[] = $gamification->sdBadgesAndChallenges->attributes;
            }

            // retreive user
            $user_Arr = [
                'id'                 => $userInfors->id, 
                'username'           => $userInfors->username, 
                'email'              => $userInfors->email, 
                'created_at'         => $userInfors->created_at, 
                'profile'            => $userInfors->userprofiles->id, 
                'gamifications'      => $gamification_Id_Arr,
                'badgeandchallenges' => $badgeandchallenge_Id_Arr
            ];
        }
        // retreive gamifications for each user
        

        $jsonArr = ['User' => $user_Arr, 'gamifications' => $gamification_Info_Arr, 'badgeandchallenges' => $badgeandchallenge_Info_Arr];

        return $jsonArr;
    }

	// Todo: this is register user
	public function actionCreate()
    {
        //$postData = json_decode(file_get_contents("php://input"));
        //exit(Security::generatePasswordHash($postData->user->password));
        $user = new \common\models\User;
        $user->username = $_POST['user']['username'];
        $user->email = $_POST['user']['email'];
        $user->password_hash = Security::generatePasswordHash($_POST['user']['password']);
        $user->access_token = $user->password_hash.$user->username;  
        $user->status = 0;     
        if ($user->validate()) {
            $user->save();
            $userprofile = new \common\models\Userprofile;
            $userprofile->sd_users_id = $user->id;
            $userprofile->save();

            // send email activation
            $headers  = 'MIME-Version: 1.0' . "\r\n";
            $headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
            $headers .= 'From: Mr. Admin < softdevelop.vd@gmail.com>' . "\r\n";

            $subject2 = "Your Activation Link";

            $message2 = "<html><body>Please click this below to activate your membership<br />".
                                    Yii::$app->createAbsoluteUrl('site/activate', array('email' => $user->email)).
                                    
                                   "
                                   
                                   Thanks you.
                                   ". sha1(mt_rand(10000, 99999).time().$email) ."
                                   </body></html>";
                                    
            mail($to, $subject2, $message2, $headers);

            $arr = ['message'=> 'Register successfully!',  'api_key'=> ['access_token'=> $user->access_token, 'user_id'=> $user->id]];
            echo json_encode($arr);
        } else {
            $arr = ['error' => true, 'message' => $user->getErrors()];
            echo json_encode($arr);
        }
        // if fail
        // server not found, 500
        //echo json_encode({'message': 'An error found! Please try again!'});
        // validate fail, 422
        //echo json_encode({'message': [{'field': 'username', 'message': 'This field is require!'}]});
        exit;
    }
}