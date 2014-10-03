<?php
use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use app\modules\administrator\assets\AppAsset;
use frontend\widgets\Alert;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-param" content="_csrf">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>

<body>
<?php $this->beginBody() ?>
    <div class="wrap">
        <?php
            NavBar::begin([
                'brandLabel' => 'My Company',
                'brandUrl' => Yii::$app->homeUrl,
                'options' => [
                    'class' => 'navbar-inverse navbar-fixed-top',
                ],
            ]);
            echo Nav::widget([
                'options' => ['class' => 'navbar-nav navbar-right'],
                'items' => [
                    ['label' => 'Home', 'url' => ['/admin']],
                    Yii::$app->user->isGuest ?
                        ['label' => 'Login', 'url' => ['/admin/login']] :
                        ['label' => 'Logout (' . Yii::$app->user->identity->username . ')',
                            'url' => ['/admin/logout'],
                            'linkOptions' => ['data-method' => 'post']],
                ],
            ]);
            NavBar::end();
        ?>
        <div class="container">
            <?= Breadcrumbs::widget([
                'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
            ]) ?>    

            <div class="row">
                <div class="col-lg-3">
                    <div id="manager-menu" class="list-group">
                        <a class="list-group-item active" href="/rbac">
                            <i class="glyphicon glyphicon-chevron-right pull-right"></i>
                            <span>Admin Manager</span>
                        </a>
                        <a class="list-group-item" href="/rbac/assigment">
                            <i class="glyphicon glyphicon-chevron-right pull-right"></i>
                            <span> --- Assigment</span>
                        </a>
                        <a class="list-group-item" href="/rbac/role">
                            <i class="glyphicon glyphicon-chevron-right pull-right"></i>
                            <span> --- Role</span>
                        </a>
                        <a class="list-group-item" href="/rbac/permission">
                            <i class="glyphicon glyphicon-chevron-right pull-right"></i>
                            <span> --- Permission</span>
                        </a>
                        <a class="list-group-item" href="/rbac/route">
                            <i class="glyphicon glyphicon-chevron-right pull-right"></i>
                            <span> --- Route</span>
                        </a>
                        <a class="list-group-item" href="/rbac/rule">
                            <i class="glyphicon glyphicon-chevron-right pull-right"></i>
                            <span> --- Rule</span>
                        </a>
                        <a class="list-group-item active" href="/admin/news">
                            <i class="glyphicon glyphicon-chevron-right pull-right"></i>
                            <span>News</span>
                        </a>
                        <a class="list-group-item" href="/admin/manage-galleries">
                            <i class="glyphicon glyphicon-chevron-right pull-right"></i>
                            <span>Galleries</span>
                        </a>
                        <a class="list-group-item" href="/admin/manage-images">
                            <i class="glyphicon glyphicon-chevron-right pull-right"></i>
                            <span>Images</span>
                        </a>
                    </div>
                 </div>
                 <div class="col-lg-9">
                   <?= $content ?>
                 </div> 
            </div>        
        </div>
    </div>

    <footer class="footer">
        <div class="container">
            <p class="pull-left">&copy; My Company 2014</p>
            <p class="pull-right">Powered by <a href="http://www.yiiframework.com/" rel="external">Yii Framework</a></p>
        </div>
    </footer>
    <?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>