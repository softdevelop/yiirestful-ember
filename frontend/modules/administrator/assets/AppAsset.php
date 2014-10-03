<?php
/**
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

namespace app\modules\administrator\assets;

use yii\web\AssetBundle;

/**
 * @author Qiang Xue <qiang.xue@gmail.com>
 * @since 2.0
 */
class AppAsset extends AssetBundle
{
    public $basePath = '';
    public $baseUrl = '@web';
    public $css = [
        'css/admin/bootstrap.css',
        'css/admin/site.css',
    ];
    public $js = [
        'js/admin/jquery.js',
        'js/admin/yii.js',
        'js/admin/yii.gridView.js',
        'js/admin/jquery.pjax.js',
        'js/admin/bootstrap.js'
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset',
    ];
}
