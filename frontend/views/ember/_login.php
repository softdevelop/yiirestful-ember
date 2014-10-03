<script type="text/x-handlebars" id="login">
<div class="small-12 columns">
    <div class="row">
        <h4>Account Login</h4>
        <form {{action loginUser on="submit"}}>
          <input type="hidden" name="YII_CSRF_TOKEN" value="<?php echo Yii::$app->request->csrfToken;?>">
          <div class="row">
            {{#if errorMessage}}
                <small class="error small-8">{{errorMessage}}</small>
            {{/if}}
            <div class="small-8">

              <div class="row">
                <div class="small-3 columns">
                  <label for="username" class="right inline">Username</label>
                </div>
                <div class="small-9 columns">
                    {{input type="text" id="username" value=username placeholder="Username"}}
                    {{#if errorUsername}}
                        <small class="error">{{errorUsername}}</small>
                    {{/if}}
                </div>
              </div>

              <div class="row">
                <div class="small-3 columns">
                  <label for="password" class="right inline">Password</label>
                </div>
                <div class="small-9 columns">
                    {{input type="password" id="password" value=password placeholder="Password"}}
                    {{#if errorPassword}}
                        <small class="error">{{errorPassword}}</small>
                    {{/if}}
                </div>
              </div>

              <div class="row">
                <div class="small-3 columns"></div>
                  <div class="small-9 columns">
                    {{input type="submit" value="Submit" class="small button success"}}
                  </div>
              </div>
            </div>
          </div>
        </form>
    </div>
</div>
</script>