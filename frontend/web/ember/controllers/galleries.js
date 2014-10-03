
// Route
App.GalleriesRoute = App.AuthenticatedRoute.extend({
  model: function() {
    return this.store.find('gallery');
  }
});

// Gallery controller
App.GalleriesController = Ember.ObjectController.extend({
  isEditing: false,

  actions: {
    // Enter add new gallery
    add: function() {
      this.set('isEditing', true);
    },

    // Cancel add gallery
    cancel: function(){
      //this.get('content').rollback();
      this.set('isEditing', false);
    },

    // Submit add gallery
    done: function() {
    	this.set('isEditing', false);
    	gallery = this.get('model');
    	data = {
        title: gallery.title,
        description: gallery.description,
        owner: App.AuthManager.get('apiKey.user')
      }
		  newGallery = this.store.createRecord('gallery', data);

    	// Save the new model
    	newGallery.save();
    	toastr.success('You have uploaded new gallery!');
    	this.set('title', '');
      this.set('description', '');
    },

    delete: function(){
      var user = this.get('model');
      user.deleteRecord();
      user.save();
      this.transitionTo('users');
    }
  }
});