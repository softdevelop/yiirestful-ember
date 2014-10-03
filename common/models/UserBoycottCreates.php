<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "sd_user_boycott_creates".
 *
 * @property integer $id
 * @property integer $sd_userprofiles_id
 * @property integer $sd_boycotts_id
 *
 * @property Userprofiles $sdUserprofiles
 * @property Boycotts $sdBoycotts
 */
class UserBoycottCreates extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%user_boycott_creates}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['sd_userprofiles_id', 'sd_boycotts_id'], 'required'],
            [['sd_userprofiles_id', 'sd_boycotts_id'], 'integer']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'sd_userprofiles_id' => 'Sd Userprofiles ID',
            'sd_boycotts_id' => 'Sd Boycotts ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSdUserprofiles()
    {
        return $this->hasOne(Userprofiles::className(), ['id' => 'sd_userprofiles_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSdBoycotts()
    {
        return $this->hasOne(Boycotts::className(), ['id' => 'sd_boycotts_id']);
    }
}
