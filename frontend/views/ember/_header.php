<?php
use yii\helpers\Html;
?>

<script type="text/x-handlebars" id="_header">
    <nav class="top-bar" data-topbar>
      <ul class="title-area">
        <li class="name">
          <h1><a href="<?php echo Yii::$app->homeUrl; ?>"><?= Html::encode($this->title) ?></a></h1>
        </li>
         <!-- Remove the class "menu-icon" to get rid of menu icon. Take out "Menu" to just have icon alone -->
        <li class="toggle-topbar menu-icon"><a href="#"><span>Menu</span></a></li>
      </ul>

      <section class="top-bar-section">
        <!-- Right Nav Section -->
        <ul class="right">
            {{#if isAuthenticated}}
              <li class="active">{{#link-to 'myaccount'}}My account{{/link-to}}</li>
              <li class="active"><a href="#" {{action 'logout'}}>Logout</a></li>
            {{else}}
              <li class="active">{{#link-to 'register'}}Register{{/link-to}}</li>
              <li class="active">{{#link-to 'login'}}Login{{/link-to}}</li>
            {{/if}}
        </ul>

        <!-- Left Nav Section -->
        <ul class="left">
          <li>{{#link-to 'index'}}Home{{/link-to}}</li>
          <li>{{#link-to 'about'}}About{{/link-to}}</li>
          <li>{{#link-to 'galleries'}}Gallery{{/link-to}}</li>
          <li><a href="<?php echo Yii::$app->getUrlManager()->createUrl('/site/contact') ?>">Contact</a></li>
        </ul>
      </section>
    </nav>
    <hr>
</script>