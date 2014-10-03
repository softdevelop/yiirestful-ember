<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "sd_comments".
 *
 * @property integer $id
 * @property string $content
 * @property string $type
 * @property string $target_type
 * @property string $created
 * @property integer $sd_users_id
 * @property integer $sd_news_id
 * @property integer $sd_boycotts_id
 * @property integer $sd_images_id
 * @property integer $sd_galleries_id
 *
 * @property Boycotts $sdBoycotts
 * @property Galleries $sdGalleries
 * @property Images $sdImages
 * @property News $sdNews
 * @property User $sdUsers
 */
class Comments extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'sd_comments';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['content'], 'string'],
            [['created'], 'safe'],
            [['sd_users_id'], 'required'],
            [['sd_users_id', 'sd_news_id', 'sd_boycotts_id', 'sd_images_id', 'sd_galleries_id'], 'integer'],
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
            'content' => 'Content',
            'type' => 'Type',
            'target_type' => 'Target Type',
            'created' => 'Created',
            'sd_users_id' => 'Sd Users ID',
            'sd_news_id' => 'Sd News ID',
            'sd_boycotts_id' => 'Sd Boycotts ID',
            'sd_images_id' => 'Sd Images ID',
            'sd_galleries_id' => 'Sd Galleries ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSdBoycotts()
    {
        return $this->hasOne(Boycotts::className(), ['id' => 'sd_boycotts_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSdGalleries()
    {
        return $this->hasOne(Galleries::className(), ['id' => 'sd_galleries_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSdImages()
    {
        return $this->hasOne(Images::className(), ['id' => 'sd_images_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSdNews()
    {
        return $this->hasOne(News::className(), ['id' => 'sd_news_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSdUsers()
    {
        return $this->hasOne(User::className(), ['id' => 'sd_users_id']);
    }
}
