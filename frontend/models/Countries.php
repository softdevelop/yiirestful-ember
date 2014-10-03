<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "sd_countries".
 *
 * @property integer $id
 * @property string $title
 * @property string $description
 * @property integer $owner
 * @property integer $visibility
 * @property integer $status
 * @property string $created
 * @property string $modified
 * @property integer $sd_galleries_id
 *
 * @property Boycotts[] $boycotts
 * @property Companies[] $companies
 * @property CompaniesActiveCountry[] $companiesActiveCountries
 * @property Galleries $sdGalleries
 * @property CountriesHasSdProducts[] $countriesHasSdProducts
 * @property Products[] $sdProducts
 */
class Countries extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'sd_countries';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['owner', 'visibility', 'status', 'sd_galleries_id'], 'integer'],
            [['created', 'modified'], 'safe'],
            [['sd_galleries_id'], 'required'],
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
            'owner' => 'Owner',
            'visibility' => 'Visibility',
            'status' => 'Status',
            'created' => 'Created',
            'modified' => 'Modified',
            'sd_galleries_id' => 'Sd Galleries ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBoycotts()
    {
        return $this->hasMany(Boycotts::className(), ['sd_countries_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCompanies()
    {
        return $this->hasMany(Companies::className(), ['sd_countries_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCompaniesActiveCountries()
    {
        return $this->hasMany(CompaniesActiveCountry::className(), ['sd_countries_id' => 'id']);
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
    public function getCountriesHasSdProducts()
    {
        return $this->hasMany(CountriesHasSdProducts::className(), ['sd_countries_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSdProducts()
    {
        return $this->hasMany(Products::className(), ['id' => 'sd_products_id'])->viaTable('sd_countries_has_sd_products', ['sd_countries_id' => 'id']);
    }
}
