<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "sd_boycotts".
 *
 * @property integer $id
 * @property string $title
 * @property string $target_type
 * @property integer $target_id
 * @property string $description
 * @property string $demand
 * @property string $taxonomy_tag
 * @property integer $owner
 * @property integer $visibility
 * @property integer $status
 * @property integer $created_at
 * @property integer $updated_at
 * @property integer $sd_companies_id
 * @property integer $sd_countries_id
 * @property integer $sd_products_id
 * @property integer $sd_users_id
 * @property integer $notification_time
 * @property integer $notification_number
 *
 * @property BoycottImages[] $boycottImages
 * @property BoycottLinks[] $boycottLinks
 * @property Companies $sdCompanies
 * @property Countries $sdCountries
 * @property Products $sdProducts
 * @property Users $sdUsers
 * @property BoycottsHasSdTags[] $boycottsHasSdTags
 * @property Tags[] $sdTags
 * @property UserBoycottCreates[] $userBoycottCreates
 */
class BoyCotts extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%boycotts}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['target_id', 'owner', 'visibility', 'status', 'created_at', 'updated_at', 'sd_companies_id', 'sd_countries_id', 'sd_products_id', 'sd_users_id', 'notification_time', 'notification_number'], 'integer'],
            [['description', 'demand', 'taxonomy_tag'], 'string'],
            [['sd_companies_id', 'sd_countries_id', 'sd_products_id', 'sd_users_id'], 'required'],
            [['title'], 'string', 'max' => 100],
            [['target_type'], 'string', 'max' => 45]
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
            'target_type' => 'Target Type',
            'target_id' => 'Target ID',
            'description' => 'Description',
            'demand' => 'Demand',
            'taxonomy_tag' => 'Taxonomy Tag',
            'owner' => 'Owner',
            'visibility' => 'Visibility',
            'status' => 'Status',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'sd_companies_id' => 'Sd Companies ID',
            'sd_countries_id' => 'Sd Countries ID',
            'sd_products_id' => 'Sd Products ID',
            'sd_users_id' => 'Sd Users ID',
            'notification_time' => 'Notification Time',
            'notification_number' => 'Notification Number',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBoycottImages()
    {
        return $this->hasMany(BoycottImages::className(), ['sd_boycotts_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBoycottLinks()
    {
        return $this->hasMany(BoycottLinks::className(), ['sd_boycotts_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSdCompanies()
    {
        return $this->hasOne(Companies::className(), ['id' => 'sd_companies_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSdCountries()
    {
        return $this->hasOne(Countries::className(), ['id' => 'sd_countries_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSdProducts()
    {
        return $this->hasOne(Products::className(), ['id' => 'sd_products_id']);
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
    public function getBoycottsHasSdTags()
    {
        return $this->hasMany(BoycottsHasSdTags::className(), ['sd_boycotts_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSdTags()
    {
        return $this->hasMany(Tags::className(), ['id' => 'sd_tags_id'])->viaTable('sd_boycotts_has_sd_tags', ['sd_boycotts_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUserBoycottCreates()
    {
        return $this->hasMany(UserBoycottCreates::className(), ['sd_boycotts_id' => 'id']);
    }
}
