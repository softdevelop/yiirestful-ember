
// Route
App.ImageRoute = App.AuthenticatedRoute.extend({
  model: function(params) {
    if (App.AuthManager.get('apiKey.user') != undefined)
      return Ember.RSVP.hash({
          image: this.store.find('image', params.image_id),
      });
  }
});


// Image controller
App.ImageController = Ember.ObjectController.extend({
  isEditing: false,

  // check if owner
  author: function(){
    return this.get('image').get('owner') == App.AuthManager.get('apiKey.user');
  }.property('image'),

  actions: {
    // Enter edit image
    edit: function() {
      this.set('isEditing', true);
    },

    // Cancel edit image
    cancel: function(){
      this.get('image').rollback();
      this.set('isEditing', false);
    },

    // Submit edit image
    doneEditing: function() {
      this.set('isEditing', false);
      image = this.get('image');
      image.save();
    },

    delete: function(){
      var image = this.get('image');
      image.deleteRecord();
      image.get('isDeleted');
      image.save();
      this.transitionTo('galleries');
    }
  }
});