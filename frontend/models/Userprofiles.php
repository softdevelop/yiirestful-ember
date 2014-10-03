<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "sd_userprofiles".
 *
 * @property integer $id
 * @property integer $sd_users_id
 * @property string $birthday
 * @property string $profile_picture
 * @property string $bio
 * @property integer $total
 *
 * @property User $sdUsers
 * @property UserprofilesHasSdBadges[] $userprofilesHasSdBadges
 * @property Badges[] $sdBadges
 * @property UserprofilesHasSdChallenges[] $userprofilesHasSdChallenges
 * @property Challenges[] $sdChallenges
 */
class Userprofiles extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'sd_userprofiles';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['sd_users_id'], 'required'],
            [['sd_users_id', 'total'], 'integer'],
            [['birthday'], 'safe'],
            [['bio'], 'string'],
            [['profile_picture'], 'string', 'max' => 255]
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
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSdUsers()
    {
        return $this->hasOne(User::className(), ['id' => 'sd_users_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUserprofilesHasSdBadges()
    {
        return $this->hasMany(UserprofilesHasSdBadges::className(), ['sd_userprofiles_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSdBadges()
    {
        return $this->hasMany(Badges::className(), ['id' => 'sd_badges_id'])->viaTable('sd_userprofiles_has_sd_badges', ['sd_userprofiles_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUserprofilesHasSdChallenges()
    {
        return $this->hasMany(UserprofilesHasSdChallenges::className(), ['sd_userprofiles_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSdChallenges()
    {
        return $this->hasMany(Challenges::className(), ['id' => 'sd_challenges_id'])->viaTable('sd_userprofiles_has_sd_challenges', ['sd_userprofiles_id' => 'id']);
    }
}
