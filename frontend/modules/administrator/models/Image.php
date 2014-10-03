<?php

namespace app\modules\administrator\models;

use Yii;

/**
 * This is the model class for table "sd_images".
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
 *
 * @property Galleries $sdGalleries
 * @property ImagesHasSdTags[] $imagesHasSdTags
 * @property Tags[] $sdTags
 */
class Image extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    
    public static function tableName()
    {
        return '{{%images}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['description'], 'string'],
            [['owner', 'visibility', 'status', 'created_at', 'updated_at', 'sd_galleries_id'], 'integer'],
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
        ];
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
    public function getImagesHasSdTags()
    {
        return $this->hasMany(ImagesHasSdTags::className(), ['sd_images_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSdTags()
    {
        return $this->hasMany(Tags::className(), ['id' => 'sd_tags_id'])->viaTable('sd_images_has_sd_tags', ['sd_images_id' => 'id']);
    }
}
