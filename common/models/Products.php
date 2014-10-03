<?php

namespace common\models;

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
 * @property integer $created_at
 * @property integer $updated_at
 * @property integer $sd_galleries_id
 * @property integer $sd_companies_id
 *
 * @property Boycotts[] $boycotts
 * @property Galleries $sdGalleries
 * @property Companies $sdCompanies
 * @property ProductsHasSdTags[] $productsHasSdTags
 * @property Tags[] $sdTags
 */
class Products extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%products}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['description'], 'string'],
            [['owner', 'visibility', 'status', 'created_at', 'updated_at', 'sd_galleries_id', 'sd_companies_id'], 'integer'],
            [['sd_galleries_id', 'sd_companies_id'], 'required'],
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
    public function getSdGalleries()
    {
        return $this->hasOne(Galleries::className(), ['id' => 'sd_galleries_id']);
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
    public function getProductsHasSdTags()
    {
        return $this->hasMany(ProductsHasSdTags::className(), ['sd_products_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSdTags()
    {
        return $this->hasMany(Tags::className(), ['id' => 'sd_tags_id'])->viaTable('sd_products_has_sd_tags', ['sd_products_id' => 'id']);
    }
}
