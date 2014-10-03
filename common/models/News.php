<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "sd_news".
 *
 * @property integer $id
 * @property string $title
 * @property string $taxonomy_tag
 * @property integer $is_published
 * @property string $published_date
 * @property integer $owener
 * @property integer $visibility
 * @property integer $status
 * @property integer $created_at
 * @property integer $updated_at
 * @property string $content
 * @property integer $sd_galleries_id
 *
 * @property Galleries $sdGalleries
 * @property NewsHasSdTags[] $newsHasSdTags
 * @property Tags[] $sdTags
 * @property TagsHasSdNews[] $tagsHasSdNews
 */
class News extends \yii\db\ActiveRecord
{
    const VISIBLE     = 1;
    const INVISIBLE   = 0;
    const VERIFIED    = 1;
    const UNVERIFIED  = 0;
    const PUBLISHED   = 1;
    const UNPUBLISHED = 0;
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%news}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['is_published', 'owener', 'visibility', 'status', 'created_at', 'updated_at', 'sd_galleries_id'], 'integer'],
            [['published_date'], 'safe'],
            [['content'], 'string'],
            [['title'], 'string', 'max' => 100],
            [['taxonomy_tag'], 'string', 'max' => 45]
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
            'taxonomy_tag' => 'Taxonomy Tag',
            'is_published' => 'Is Published',
            'published_date' => 'Published Date',
            'owener' => 'Owener',
            'visibility' => 'Visibility',
            'status' => 'Status',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'content' => 'Content',
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
    public function getNewsHasSdTags()
    {
        return $this->hasMany(NewsHasSdTags::className(), ['sd_news_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSdTags()
    {
        return $this->hasMany(Tags::className(), ['id' => 'sd_tags_id'])->viaTable('sd_tags_has_sd_news', ['sd_news_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTagsHasSdNews()
    {
        return $this->hasMany(TagsHasSdNews::className(), ['sd_news_id' => 'id']);
    }
}
