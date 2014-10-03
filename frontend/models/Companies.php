<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "sd_companies".
 *
 * @property integer $id
 * @property string $title
 * @property string $description
 * @property string $short_info
 * @property integer $owner
 * @property integer $visibility
 * @property integer $status
 * @property string $created
 * @property string $modified
 * @property integer $sd_galleries_id
 * @property integer $sd_countries_id
 *
 * @property Countries $sdCountries
 * @property Galleries $sdGalleries
 * @property CompaniesActiveCountry[] $companiesActiveCountries
 * @property Products[] $products
 */
class Companies extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'sd_companies';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['owner', 'visibility', 'status', 'sd_galleries_id', 'sd_countries_id'], 'integer'],
            [['created', 'modified'], 'safe'],
            [['sd_galleries_id', 'sd_countries_id'], 'required'],
            [['title'], 'string', 'max' => 100],
            [['description', 'short_info'], 'string', 'max' => 255]
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
            'short_info' => 'Short Info',
            'owner' => 'Owner',
            'visibility' => 'Visibility',
            'status' => 'Status',
            'created' => 'Created',
            'modified' => 'Modified',
            'sd_galleries_id' => 'Sd Galleries ID',
            'sd_countries_id' => 'Sd Countries ID',
        ];
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
    public function getSdGalleries()
    {
        return $this->hasOne(Galleries::className(), ['id' => 'sd_galleries_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCompaniesActiveCountries()
    {
        return $this->hasMany(CompaniesActiveCountry::className(), ['sd_companies_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProducts()
    {
        return $this->hasMany(Products::className(), ['sd_companies_id' => 'id']);
    }
}
