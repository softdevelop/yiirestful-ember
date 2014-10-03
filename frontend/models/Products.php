<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "sd_products".
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
 * @property integer $sd_companies_id
 *
 * @property Boycotts[] $boycotts
 * @property CountriesHasSdProducts[] $countriesHasSdProducts
 * @property Countries[] $sdCountries
 * @property Companies $sdCompanies
 * @property Galleries $sdGalleries
 */
class Products extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'sd_products';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['owner', 'visibility', 'status', 'sd_galleries_id', 'sd_companies_id'], 'integer'],
            [['created', 'modified'], 'safe'],
            [['sd_galleries_id', 'sd_companies_id'], 'required'],
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
            'sd_companies_id' => 'Sd Companies ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBoycotts()
    {
        return $this->hasMany(Boycotts::className(), ['sd_products_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCountriesHasSdProducts()
    {
        return $this->hasMany(CountriesHasSdProducts::className(), ['sd_products_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSdCountries()
    {
        return $this->hasMany(Countries::className(), ['id' => 'sd_countries_id'])->viaTable('sd_countries_has_sd_products', ['sd_products_id' => 'id']);
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
    public function getSdGalleries()
    {
        return $this->hasOne(Galleries::className(), ['id' => 'sd_galleries_id']);
    }
}
