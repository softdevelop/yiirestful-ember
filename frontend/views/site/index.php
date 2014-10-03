<?php
use yii\helpers\Html;
use yii\helpers\Url;
/**
 * @var yii\web\View $this
 */
$this->title = 'My Yii Application';
?>
<div class="site-index" id="ember-app">
    <script type="text/x-handlebars">
        {{partial "header"}}
        {{outlet}}
    </script>

    <!-- 
    *
    *   Include all template files
    *
    -->
    <?php echo $this->render('/ember/_news.php'); ?>
    <?php echo $this->render('/ember/_header.php'); ?>
    <?php echo $this->render('/ember/_home.php'); ?>
    <?php echo $this->render('/ember/_user.php'); ?>
    <?php echo $this->render('/ember/_register.php'); ?>
    <?php echo $this->render('/ember/_login.php'); ?>
    <?php echo $this->render('/ember/_about.php'); ?>
    <?php echo $this->render('/ember/_thankyou.php'); ?>
    <?php echo $this->render('/ember/_myaccount.php'); ?>
    <?php echo $this->render('/ember/_galleries.php'); ?>
    <?php echo $this->render('/ember/_gallery.php'); ?>
    <?php echo $this->render('/ember/_image.php'); ?>
</div>
