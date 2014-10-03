<?php

namespace common\models;

use Yii;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "sd_badges_and_challenges".
 *
 * @property integer $id
 * @property string $title
 * @property string $text
 * @property string $image
 * @property integer $points
 * @property string $string_id
 * @property integer $created_at
 * @property integer $updated_at
 * @property integer $type
 *
 * @property Gamifications[] $gamifications
 */
class BadgesAndChallenges extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%badges_and_challenges}}';
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
            [['text'], 'string'],
            [['points', 'created_at', 'updated_at', 'type'], 'integer'],
            [['title'], 'string', 'max' => 100],
            [['image', 'string_id'], 'string', 'max' => 255],
            [['string_id'], 'unique']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => 'Title',
            'text' => 'Text',
            'image' => 'Image',
            'points' => 'Points',
            'string_id' => 'String ID',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'type' => 'Type',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getGamifications()
    {
        return $this->hasOne(Gamifications::className(), ['sd_badges_and_challenges_id' => 'id']);
    }
}
