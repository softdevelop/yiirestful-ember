<script type="text/x-handlebars" id="myaccount">
<div class="small-12 columns">
    <div class="row">
    	<div class="small-2 columns">
            <a {{action 'editPicture'}}>
                {{#if avatar}}
                  <img {{bind-attr src=avatar}} alt="#" class="userprofile">
                {{else}}
                  {{#if profile.profile_picture}}
                    <img {{bind-attr src=profile.profile_picture}} alt="#" class="userprofile">
                  {{else}}
                    <img src="/img/feature_users.png" alt="#">
                  {{/if}}
                {{/if}}
            </a>
    	</div>
    	<div class="small-10 columns">
        {{#if isEditingPicture }}
          <form action="<?php echo Yii::$app->homeUrl; ?>userprofile/picture" method="POST" id="changeProfileImage" enctype="multipart/form-data">
            {{input type="hidden" id="id" value=user.id name="id"}}
            <input type="file" name="file" id="fileToUpload"><br>
            <button {{action 'doneEditPicture'}} class="small button success">Done</button>
            <button {{action 'cancelPicture'}} class="small button success">Cancel</button>
          </form>
        {{else}}
          <p>Username: {{user.username}}</p>
          <p>Email: {{user.email}}</p>
          <p>Registration from: {{format-date user.created_at}}</p>
        {{/if}}
    	</div>
    </div>
    <hr>
    <div class="row">
        <div class="small-6 columns">
        {{#if author}}
            {{#if isEditing}}
                {{partial 'profile/edit'}}
                <button {{action 'cancel'}} class="small button success">Cancel</button>
                <button {{action 'doneEditing'}} class="small button success">Done</button>
            {{else}}
                <button {{action 'edit'}} class="small button">Edit</button>
                {{partial 'profile/view'}}
            {{/if}}
        {{else}}
            {{partial 'profile/view'}}
        {{/if}}
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
                 {{#each user.badgeandchallenges}}
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
                  <th>Money spend</th>
                </tr>
              </thead>
              <tbody>
              {{#each boycottsigned}}
                <tr>
                  <td>{{title}}</td>
                  <td>{{target_type}}</td>
                  <td>{{description}}</td>
                  <td>{{demand}}</td>
                  <td>{{sd_products_id}}</td>
                  <td>{{money_spend}}</td>
                </tr>
              {{/each}}
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
              {{#each boycottcreated}}
                <tr>
                  <td>{{title}}</td>
                  <td>{{target_type}}</td>
                  <td>{{description}}</td>
                  <td>{{demand}}</td>
                  <td>{{sd_products_id}}</td>
                </tr>
              {{/each}}
              </tbody>
            </table>
        </div>
    </div>
</div>
</script>

<script type="text/x-handlebars" id="profile/_view">
    <p>Name: {{profile.name}}</p>
    <p>Surname: {{profile.surname}}</p>
    <p>Birthday: {{profile.birthday}}</p>
    <p>Comment: {{profile.comment}}</p>
    <p>Short Bio: {{profile.bio}}</p>
</script>

<script type="text/x-handlebars" id="profile/_edit">
    <div class="row">
        <div class="small-3 columns">
          <label for="name" class="right inline">Name</label>
        </div>
        <div class="small-9 columns">
            {{input type="text" id="name" value=profile.name placeholder="Name"}}
        </div>
    </div>

    <div class="row">
        <div class="small-3 columns">
          <label for="surname" class="right inline">Surname</label>
        </div>
        <div class="small-9 columns">
            {{input type="text" id="surname" value=profile.surname placeholder="Surname"}}
        </div>
    </div>

    <div class="row">
        <div class="small-3 columns">
          <label for="birthday" class="right inline">Birthday</label>
        </div>
        <div class="small-9 columns">
            {{date-picker value=profile.birthday id="birthday" placeholder="Birthday"}}
        </div>
    </div>

    <div class="row">
        <div class="small-3 columns">
          <label for="comment" class="right inline">Comment</label>
        </div>
        <div class="small-9 columns">
            {{input type="text" id="comment" value=profile.comment placeholder="Comment"}}
        </div>
    </div>

    <div class="row">
        <div class="small-3 columns">
          <label for="bio" class="right inline">Short bio</label>
        </div>
        <div class="small-9 columns">
            {{input type="text" id="bio" value=profile.bio placeholder="bio"}}
        </div>
    </div>
</script>