<script type="text/x-handlebars" id="register">
<div class="small-12 columns">
    <div class="row">
        <h4>Account Register</h4>
        <form {{action createUser on="submit"}}>
          <div class="row">
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
                <div class="small-3 columns">
                  <label for="confirmpassword" class="right inline">Confirm Password</label>
                </div>
                <div class="small-9 columns">
                    {{input type="password" id="confirmpassword" value=confirmPassword placeholder="Confirm Password"}}
                    {{#if errorconfirmPassword}}
                        <small class="error">{{errorconfirmPassword}}</small>
                    {{/if}}
                </div>
              </div>

              <div class="row">
                <div class="small-3 columns">
                  <label for="email" class="right inline">Email</label>
                </div>
                <div class="small-9 columns">
                    {{input type="email" id="email" value=email placeholder="Email"}}
                    {{#if errorEmail}}
                        <small class="error">{{errorEmail}}</small>
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