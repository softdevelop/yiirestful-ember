<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "sd_galleries".
 *
 * @property integer $id
 * @property string $title
 * @property string $description
 * @property string $tags
 * @property string $comments
 * @property integer $owner
 * @property integer $visibility
 * @property integer $status
 * @property string $created
 * @property string $modified
 *
 * @property Comments[] $comments
 * @property Companies[] $companies
 * @property Countries[] $countries
 * @property GalleriesHasSdTags[] $galleriesHasSdTags
 * @property Tags[] $sdTags
 * @property Images[] $images
 * @property Likes[] $likes
 * @property Products[] $products
 */
class Galleries extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'sd_galleries';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['tags', 'comments'], 'string'],
            [['owner', 'visibility', 'status'], 'integer'],
            [['created', 'modified'], 'safe'],
            [['title'], 'string', 'max' => 100],
            [['description'], 'string', 'max' => 255]
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
            'tags' => 'Tags',
            'comments' => 'Comments',
            'owner' => 'Owner',
            'visibility' => 'Visibility',
            'status' => 'Status',
            'created' => 'Created',
            'modified' => 'Modified',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getComments()
    {
        return $this->hasMany(Comments::className(), ['sd_galleries_id' => 'id']);
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
    public function getLikes()
    {
        return $this->hasMany(Likes::className(), ['sd_galleries_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProducts()
    {
        return $this->hasMany(Products::className(), ['sd_galleries_id' => 'id']);
    }
}
