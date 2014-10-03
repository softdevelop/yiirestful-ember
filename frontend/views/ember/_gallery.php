
<script type="text/x-handlebars" id="gallery">
<div class="small-12 columns">
  <div class='row'>
    <div class="small-4 columns">
      <p>
       {{#link-to 'newimage' gallery.id class="large button success"}}Create new image{{/link-to}}
      </p>
    </div>
    <div class="small-8 columns">
      {{#if author}}
          {{#if isEditing}}
              {{partial 'gallery/edit'}}
              <button {{action 'cancel'}} class="small button success">Cancel</button>
              <button {{action 'doneEditing'}} class="small button success">Done</button>
          {{else}}
              <button {{action 'edit'}} class="small button">Edit</button>
              <button {{action 'delete'}} class="small button alert">Delete</button>
              {{partial 'gallery/view'}}
          {{/if}}
      {{else}}
          {{partial 'gallery/view'}}
      {{/if}}
    </div>
  </div>
  <hr>
  <div class="row">
  {{#each images}}
    <div class="small-4 columns gallery">
      {{#link-to 'image' id}}
        <div class="image-box">
          <div class="image-box-header">{{title}}</div>
          {{#if url}}
            <div class="image-box-content"><img {{bind-attr src=url}} alt="#"></div>
          {{else}}
            <div class="image-box-content"><img src="/img/feature_users.png" alt="#"></div>
          {{/if}}
          <div class="image-box-footer"><span>author: {{owner}}</span></div>
        </div>
      {{/link-to}}
    </div>
  {{/each}}
  </div>
  <hr>
</div>
</script>

<script type="text/x-handlebars" id="gallery/_view">
    <p>Title: {{gallery.title}}</p>
    <p>Description: {{gallery.description}}</p>
    <p>Author: {{gallery.owner}}</p>
</script>

<script type="text/x-handlebars" id="gallery/_edit">
    <div class="row">
        <div class="small-3 columns">
          <label for="title" class="right inline">Title</label>
        </div>
        <div class="small-9 columns">
            {{input type="text" id="title" value=gallery.title placeholder="Title"}}
        </div>
    </div>

    <div class="row">
        <div class="small-3 columns">
          <label for="description" class="right inline">Description</label>
        </div>
        <div class="small-9 columns">
            {{input type="text" id="description" value=gallery.description placeholder="Description"}}
        </div>
    </div>
</script>