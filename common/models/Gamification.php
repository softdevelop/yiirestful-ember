<?php

namespace common\models;

use Yii;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "sd_gamifications".
 *
 * @property integer $id
 * @property integer $f_id
 * @property integer $points
 * @property string $reason
 * @property string $target
 * @property integer $sd_userprofiles_id
 * @property integer $created_at
 * @property integer $updated-at
 * @property integer $sd_badges_and_challenges_id
 *
 * @property Userprofiles $sdUserprofiles
 * @property BadgesAndChallenges $sdBadgesAndChallenges
 */
class Gamification extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%gamifications}}';
    }

    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'timestamp' => [
                'class' => 'yii\behaviors\TimestampBehavior',
                'attributes' => [
                    ActiveRecord::EVENT_BEFORE_INSERT => ['created_at', 'updated_at'],
                    ActiveRecord::EVENT_BEFORE_UPDATE => ['updated_at'],
                ],
            ],
        ];
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['f_id', 'points', 'sd_userprofiles_id', 'created_at', 'updated-at', 'sd_badges_and_challenges_id'], 'integer'],
            [['reason'], 'string'],
            [['sd_userprofiles_id', 'sd_badges_and_challenges_id'], 'required'],
            [['target'], 'string', 'max' => 45]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'f_id' => 'F ID',
            'points' => 'Points',
            'reason' => 'Reason',
            'target' => 'Target',
            'sd_userprofiles_id' => 'Sd Userprofiles ID',
            'created_at' => 'Created At',
            'updated-at' => 'Updated At',
            'sd_badges_and_challenges_id' => 'Sd Badges And Challenges ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSdUserprofiles()
    {
        return $this->hasOne(Userprofile::className(), ['id' => 'sd_userprofiles_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSdBadgesAndChallenges()
    {
        return $this->hasOne(BadgesAndChallenges::className(), ['id' => 'sd_badges_and_challenges_id']);
    }
}
