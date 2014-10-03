<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "sd_likes".
 *
 * @property integer $id
 * @property string $type
 * @property string $target_type
 * @property integer $sd_users_id
 * @property integer $f_id
 * @property integer $created_at
 * @property integer $updated_at
 *
 * @property Users $sdUsers
 */
class Like extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%likes}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['sd_users_id', 'f_id'], 'required'],
            [['sd_users_id', 'f_id', 'created_at', 'updated_at'], 'integer'],
            [['type', 'target_type'], 'string', 'max' => 45]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'type' => 'Type',
            'target_type' => 'Target Type',
            'sd_users_id' => 'Sd Users ID',
            'f_id' => 'F ID',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSdUsers()
    {
        return $this->hasOne(Users::className(), ['id' => 'sd_users_id']);
    }
}
