<?php
/**
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

namespace frontend\assets;

use yii\web\AssetBundle;

/**
 * @author Qiang Xue <qiang.xue@gmail.com>
 * @since 2.0
 */
class AppAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
        'css/foundation.css',
        'css/foundation-datepicker.css',
        'css/toastr.min.css',
        'css/custom.css',
    ];
    public $js = [
        'js/libs/toastr.min.js',
        'js/vendor/modernizr.js',
        'js/foundation.min.js',
        'js/libs/foundation-datepicker.js',
        'js/libs/handlebars-1.0.0.js',
        'js/libs/ember.min.js',
        //'js/libs/ember-states.js',
        'js/libs/ember-data.min.js',
        'js/libs/ember-uploader.min.js',

        'js/libs/moment.min.js',
        'js/libs/showdown.min.js',
        'js/vendor/jquery.cookie.js',
        'js/custom.js',
        'js/ajaxfileupload.js',

        // ember application js files
        'ember/app.js',
        'ember/util.js',
        'ember/components/attributes_type.js',

        // model
        'ember/models/user.js',
        'ember/models/apiKey.js',
        'ember/models/userprofile.js',
        'ember/models/gamification.js',
        'ember/models/badgeandchallenge.js',
        'ember/models/gallery.js',
        'ember/models/image.js',
        'ember/models/boycottsigned.js',
        'ember/models/boycottcreated.js',
        'ember/models/boycott.js',
        'ember/models/boycottrank.js',
        'ember/models/news.js',

        // components
        'ember/components/auth_manager.js',
        'ember/components/authenticated_route.js',

        // controller
        'ember/controllers/user.js',
        'ember/controllers/register.js',
        'ember/controllers/login.js',
        'ember/controllers/myaccount.js',
        'ember/controllers/galleries.js',
        'ember/controllers/gallery.js',
        'ember/controllers/home.js',
        'ember/controllers/newimage.js',
        'ember/controllers/news.js',
        'ember/controllers/image.js',

    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset',
    ];
}
