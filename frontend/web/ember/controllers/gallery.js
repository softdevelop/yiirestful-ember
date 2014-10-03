
// Route
App.GalleryRoute = App.AuthenticatedRoute.extend({
  model: function(params) {
    if (App.AuthManager.get('apiKey.user') != undefined)
      return Ember.RSVP.hash({
          gallery: this.store.find('gallery', params.gallery_id),
          images: this.store.find('image', {sd_galleries_id: params.gallery_id}),
      });
  }
});


// gallery controller
App.GalleryController = Ember.ObjectController.extend({
  isEditing: false,

  // check if owner
  author: function(){
    return this.get('gallery').get('owner') == App.AuthManager.get('apiKey.user');
  }.property('gallery'),

  actions: {
    // Enter edit gallery
    edit: function() {
      this.set('isEditing', true);
    },

    // Cancel edit gallery
    cancel: function(){
      this.get('gallery').rollback();
      this.set('isEditing', false);
    },

    // Submit edit gallery
    doneEditing: function() {
      this.set('isEditing', false);
      gallery = this.get('gallery');
      gallery.save();
    },

    delete: function(){
      var gallery = this.get('gallery');
      gallery.deleteRecord();
      gallery.get('isDeleted');
      gallery.save();
      this.transitionTo('galleries');
    }
  }
});