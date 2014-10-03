<script type="text/x-handlebars" id="newimage">
    <div class='row'>
      <button {{action 'cancel'}} class="large button success">Cancel</button>
      <button {{action 'done'}} class="large button success">Done</button>
    </div>
    <hr>
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

    <div class="row">
        <div class="small-3 columns">
          <label for="description" class="right inline">Image</label>
        </div>
        <div class="small-9 columns">
            {{file-upload url="/images/upload"}}
        </div>
    </div>
</script>


<script type="text/x-handlebars" id="image">
<div class="small-12 columns">
  <div class='row'>
    <div class="small-4 columns">
    </div>
    <div class="small-8 columns">
      {{#if author}}
          {{#if isEditing}}
              {{partial 'image/edit'}}
              <button {{action 'cancel'}} class="small button success">Cancel</button>
              <button {{action 'doneEditing'}} class="small button success">Done</button>
          {{else}}
              <button {{action 'edit'}} class="small button">Edit</button>
              <button {{action 'delete'}} class="small button alert">Delete</button>
              {{partial 'image/view'}}
          {{/if}}
      {{else}}
          {{partial 'image/view'}}
      {{/if}}
    </div>
  </div>
  <div class="row">
    <div class="small-4 columns gallery">
      <div class="image-box">
        {{#if image.url}}
          <div class="image-box-content"><img {{bind-attr src=image.url}} alt="#"></div>
        {{else}}
          <div class="image-box-content"><img src="/img/feature_users.png" alt="#"></div>
        {{/if}}
      </div>
    </div>
  </div>
  <hr>
</div>
</script>

<script type="text/x-handlebars" id="image/_view">
    <p>Title: {{image.title}}</p>
    <p>Description: {{image.description}}</p>
    <p>Author: {{image.owner}}</p>
</script>

<script type="text/x-handlebars" id="image/_edit">
    <div class="row">
        <div class="small-3 columns">
          <label for="title" class="right inline">Title</label>
        </div>
        <div class="small-9 columns">
            {{input type="text" id="title" value=image.title placeholder="Title"}}
        </div>
    </div>

    <div class="row">
        <div class="small-3 columns">
          <label for="description" class="right inline">Description</label>
        </div>
        <div class="small-9 columns">
            {{input type="text" id="description" value=image.description placeholder="Description"}}
        </div>
    </div>
</script>