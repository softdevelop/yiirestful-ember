<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\modules\administrator\models\GallerySearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Galleries';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="gallery-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Gallery', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'title',
            'description:ntext',
            'owner',
            'visibility',
            'status',
            // 'created_at',
            // 'updated_at',
            'viewallimage' =>
             [
                'label'=>'bla',
                'format' => 'raw',
               'value'=>function ($data) {
                    return Html::a('View All', ['viewallimage']);
                },
            ],
           
             
            ['class' => 'yii\grid\ActionColumn'],

        ],
    ]); ?>

</div>
