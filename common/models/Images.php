<?php

namespace common\models;

use Yii;
use yii\db\ActiveRecord;

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
 * @property string $url
 *
 * @property Galleries $sdGalleries
 * @property ImagesHasSdTags[] $imagesHasSdTags
 * @property Tags[] $sdTags
 */
class Images extends ActiveRecord
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
        return '{{%images}}';
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
            [['description', 'url'], 'string'],
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
            'url' => 'Url',
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
