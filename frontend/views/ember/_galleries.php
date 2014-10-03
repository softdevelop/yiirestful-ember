<script type="text/x-handlebars" id="galleries">
<div class="small-12 columns">
  {{#if isEditing}}
    <div class='row'>
      <button {{action 'cancel'}} class="large button success">Cancel</button>
      <button {{action 'done'}} class="large button success">Done</button>
    </div>
    <hr>
    {{partial 'galleries/add'}}
  {{else}}
    <div class='row'>
      <p><button class="large button success" {{action 'add'}}>Create new gallery</button></p>
    </div>
    <hr>
    <div class="row">
    {{#each model}}
      <div class="small-4 columns gallery">
        {{#link-to 'gallery' id}}
          <div class="image-box">
            <div class="image-box-header">{{title}}</div>
            <div class="image-box-content"><img src="/img/feature_users.png" alt="#"></div>
            <div class="image-box-footer"><span>author: {{owner}}</span></div>
          </div>
        {{/link-to}}
      </div>
    {{/each}}
    </div>
  {{/if}}

  <hr>
</div>
</script>

<script type="text/x-handlebars" id="galleries/_add">
    <div class="row">
        <div class="small-3 columns">
          <label for="title" class="right inline">Title</label>
        </div>
        <div class="small-9 columns">
            {{input type="text" id="title" value=title placeholder="Title"}}
        </div>
    </div>

    <div class="row">
        <div class="small-3 columns">
          <label for="description" class="right inline">Description</label>
        </div>
        <div class="small-9 columns">
            {{input type="text" id="description" value=description placeholder="Description"}}
        </div>
    </div>
</script>