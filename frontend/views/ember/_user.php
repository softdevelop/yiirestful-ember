<script type="text/x-handlebars" id="user">
<div class="small-12 columns">
    <div class="row">
      <div class="small-2 columns">
            <a>
                <img src="<?php echo Yii::$app->homeUrl; ?>img/feature_users.png" alt="#" class="userprofile">
            </a>
      </div>
      <div class="small-10 columns">
          <p>Username: {{username}}</p>
          <p>Email: {{email}}</p>
          <p>Registration from: {{format-date created_at}}</p>
      </div>
    </div>
    <hr>
    <div class="row">
        <div class="small-6 columns">
            {{partial 'profile/view'}}
        </div>
    </div>

    <div class="row">
        <div class="small-12 columns">
            <h1>Badges and Challenges</h1>
            <table>
              <thead>
                <tr>
                  <th width="200">Title</th>
                  <th>Text</th>
                  <th width="150">Points</th>
                  <th width="150">Type</th>
                </tr>
              </thead>
              <tbody>
                 {{#each badgeandchallenges}}
                <tr>
                  <td>{{title}}</td>
                  <td>{{text}}</td>
                  <td>{{points}}</td>
                  <td>{{type}}</td>
                </tr>
                {{/each}}
              </tbody>
            </table>
        </div>
    </div>

    <div class="row">
        <div class="small-12 columns">
            <h1>Boycotts Signed</h1>
            <table>
              <thead>
                <tr>
                  <th width="200">Title</th>
                  <th>Target</th>
                  <th width="150">Descrition</th>
                  <th width="150">Demand</th>
                  <th>Product</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Content Goes Here</td>
                  <td>This is longer content Donec id elit non mi porta gravida at eget metus.</td>
                  <td>Content Goes Here</td>
                  <td>Content Goes Here</td>
                  <td>Content Goes Here</td>
                </tr>
              </tbody>
            </table>
        </div>
    </div>

    <div class="row">
        <div class="small-12 columns">
            <h1>Boycotts Created</h1>
            <table>
              <thead>
                <tr>
                  <th width="200">Title</th>
                  <th>Target</th>
                  <th width="150">Descrition</th>
                  <th width="150">Demand</th>
                  <th>Product</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Content Goes Here</td>
                  <td>This is longer content Donec id elit non mi porta gravida at eget metus.</td>
                  <td>Content Goes Here</td>
                  <td>Content Goes Here</td>
                  <td>Content Goes Here</td>
                </tr>
              </tbody>
            </table>
        </div>
    </div>
</div>
</script>

<script type="text/x-handlebars" id="user/_view">
    <p>Name: {{userprofile.name}}</p>
    <p>Surname: {{userprofile.surname}}</p>
    <p>Birthday: {{userprofile.birthday}}</p>
    <p>Comment: {{userprofile.comment}}</p>
    <p>Short Bio: {{userprofile.bio}}</p>
</script>