<?php

namespace app\models;

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
 * @property string $created
 * @property string $modified
 * @property string $content
 *
 * @property Comments[] $comments
 * @property Likes[] $likes
 * @property NewsHasSdTags[] $newsHasSdTags
 * @property Tags[] $sdTags
 * @property TagsHasSdNews[] $tagsHasSdNews
 */
class News extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'sd_news';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['is_published', 'owener', 'visibility', 'status'], 'integer'],
            [['published_date', 'created', 'modified'], 'safe'],
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
            'created' => 'Created',
            'modified' => 'Modified',
            'content' => 'Content',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getComments()
    {
        return $this->hasMany(Comments::className(), ['sd_news_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getLikes()
    {
        return $this->hasMany(Likes::className(), ['sd_news_id' => 'id']);
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
