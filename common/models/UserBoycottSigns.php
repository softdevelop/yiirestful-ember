<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "sd_user_boycott_signs".
 *
 * @property integer $id
 * @property integer $sd_userprofiles_id
 * @property integer $sd_boycotts_id
 * @property integer $money_spend
 *
 * @property Userprofiles $sdUserprofiles
 */
class UserBoycottSigns extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%user_boycott_signs}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['sd_userprofiles_id', 'sd_boycotts_id'], 'required'],
            [['sd_userprofiles_id', 'sd_boycotts_id', 'money_spend'], 'integer']
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
            'money_spend' => 'Money Spend',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSdUserprofile()
    {
        return $this->hasOne(Userprofile::className(), ['id' => 'sd_userprofiles_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSdBoycotts()
    {
        return $this->hasOne(BoyCotts::className(), ['id' => 'sd_boycotts_id']);
    }
}
