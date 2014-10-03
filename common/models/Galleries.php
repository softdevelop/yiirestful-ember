<?php

namespace common\models;

use Yii;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "sd_galleries".
 *
 * @property integer $id
 * @property string $title
 * @property string $description
 * @property integer $owner
 * @property integer $visibility
 * @property integer $status
 * @property integer $created_at
 * @property integer $updated_at
 *
 * @property Companies[] $companies
 * @property Countries[] $countries
 * @property GalleriesHasSdTags[] $galleriesHasSdTags
 * @property Tags[] $sdTags
 * @property Images[] $images
 * @property News[] $news
 * @property Products[] $products
 */
class Galleries extends ActiveRecord
{
    const VISIBLE = 1;
    const INVISIBLE = 0;
    const VERIFIED = 1;
    const UNVERIFIED = 0;
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%galleries}}';
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
            [['description'], 'string'],
            [['owner', 'visibility', 'status', 'created_at', 'updated_at'], 'integer'],
            [['title'], 'string', 'max' => 100]
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
            'description' => 'Description',
            'owner' => 'Owner',
            'visibility' => 'Visibility',
            'status' => 'Status',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCompanies()
    {
        return $this->hasMany(Companies::className(), ['sd_galleries_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCountries()
    {
        return $this->hasMany(Countries::className(), ['sd_galleries_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getGalleriesHasSdTags()
    {
        return $this->hasMany(GalleriesHasSdTags::className(), ['sd_galleries_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSdTags()
    {
        return $this->hasMany(Tags::className(), ['id' => 'sd_tags_id'])->viaTable('sd_galleries_has_sd_tags', ['sd_galleries_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getImages()
    {
        return $this->hasMany(Images::className(), ['sd_galleries_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getNews()
    {
        return $this->hasMany(News::className(), ['sd_galleries_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProducts()
    {
        return $this->hasMany(Products::className(), ['sd_galleries_id' => 'id']);
    }
}
