<?php
$params = array_merge(
    require(__DIR__ . '/../../common/config/params.php'),
    require(__DIR__ . '/../../common/config/params-local.php'),
    require(__DIR__ . '/params.php'),
    require(__DIR__ . '/params-local.php')
);

return [
    'id' => 'app-frontend',
    'basePath' => dirname(__DIR__),
    'bootstrap' => ['log'],
    'controllerNamespace' => 'frontend\controllers',
    'components' => [
       
        // UrlManager
        'urlManager' => array(
            'class' => 'yii\web\UrlManager',

            // Disable index.php
            'showScriptName' => false,

            // Disable r= routes
            'enablePrettyUrl' => true,
            'rules' => [
                ['class' => 'yii\rest\UrlRule', 'controller' => 'user'],
                ['class' => 'yii\rest\UrlRule', 'controller' => 'register'],
                ['class' => 'yii\rest\UrlRule', 'controller' => 'userprofile'],
                ['class' => 'yii\rest\UrlRule', 'controller' => 'gamification'],
                ['class' => 'yii\rest\UrlRule', 'controller' => 'badgesandchallenges'],
                ['class' => 'yii\rest\UrlRule', 'controller' => 'boycottsigneds'],
                ['class' => 'yii\rest\UrlRule', 'controller' => 'boycottcreateds'],
                ['class' => 'yii\rest\UrlRule', 'controller' => 'galleries'],
                ['class' => 'yii\rest\UrlRule', 'controller' => 'images'],
                ['class' => 'yii\rest\UrlRule', 'controller' => 'news'],
            ],
        ),
        'user' => [
            'identityClass' => 'common\models\User',
            'enableAutoLogin' => true,
        ],

        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
        'request'=>array(
            'enableCsrfValidation'=>false,
        ),
        'authManager' => [
            'class' => 'yii\rbac\DbManager', // or use 'yii\rbac\DbManager'
        ],
    ],
    'modules' => [
        'rbac' => [
            'class' => 'mdm\admin\Module',
            'allowActions' => [
                //'admin/*', // add or remove allowed actions to this list
            ]
        ],
        'admin' => [
            'class' => 'app\modules\administrator\administrator',
        ],
    ],
    'params' => $params,
];
