<?php

namespace common\models;

use Yii;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "sd_userprofiles".
 *
 * @property integer $id
 * @property integer $sd_users_id
 * @property string $birthday
 * @property string $profile_picture
 * @property string $bio
 * @property integer $total
 * @property string $name
 * @property string $surname
 * @property integer $created_at
 * @property integer $updated_at
 * @property string $comment
 *
 * @property Gamifications[] $gamifications
 * @property UserBoycottCreates[] $userBoycottCreates
 * @property UserBoycottSigns[] $userBoycottSigns
 * @property Users $sdUsers
 */
class Userprofile extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%userprofiles}}';
    }
    // contain url of image
    public $path_uploaded;
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
            [['sd_users_id'], 'required'],
            [['sd_users_id', 'total', 'created_at', 'updated_at'], 'integer'],
            [['birthday'], 'safe'],
            [['bio', 'comment'], 'string'],
            [['profile_picture'], 'string', 'max' => 255],
            [['name', 'surname'], 'string', 'max' => 100]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'sd_users_id' => 'Sd Users ID',
            'birthday' => 'Birthday',
            'profile_picture' => 'Profile Picture',
            'bio' => 'Bio',
            'total' => 'Total',
            'name' => 'Name',
            'surname' => 'Surname',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'comment' => 'Comment',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getGamifications()
    {
        return $this->hasMany(Gamification::className(), ['sd_userprofiles_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUserBoycottCreates()
    {
        return $this->hasMany(UserBoycottCreates::className(), ['sd_userprofiles_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUserBoycottSigns()
    {
        return $this->hasMany(UserBoycottSigns::className(), ['sd_userprofiles_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSdUsers()
    {
        return $this->hasOne(Users::className(), ['id' => 'sd_users_id']);
    }
}
