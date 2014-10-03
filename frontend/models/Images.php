<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "sd_images".
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
 * @property integer $sd_galleries_id
 *
 * @property Comments[] $comments
 * @property Galleries $sdGalleries
 * @property ImagesHasSdTags[] $imagesHasSdTags
 * @property Tags[] $sdTags
 * @property Likes[] $likes
 */
class Images extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'sd_images';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['tags', 'comments'], 'string'],
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
            'tags' => 'Tags',
            'comments' => 'Comments',
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
    public function getComments()
    {
        return $this->hasMany(Comments::className(), ['sd_images_id' => 'id']);
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

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getLikes()
    {
        return $this->hasMany(Likes::className(), ['sd_images_id' => 'id']);
    }
}
