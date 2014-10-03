// NewImage route
App.NewimageRoute = Ember.Route.extend({
  model: function(params) {
    if (App.AuthManager.get('apiKey.user') != undefined)
      return Ember.RSVP.hash({
          gallery_id: params.gallery_id,
      });
  }
});

// NewImage controller
App.NewimageController = Ember.ObjectController.extend({
  actions: {
    // Cancel add image
    cancel: function(){
      this.transitionToRoute('/gallery/' + this.get('gallery_id'));
    },

    // Submit add image
    done: function() {
      if ($.cookie('image') == undefined){
        toastr.error('Please check your image before you save!');
      }
      else{
      	image = this.get('model');
      	data = {
  	      title: image.title,
  	      description: image.description,
  	      owner: App.AuthManager.get('apiKey.user'),
  	      sd_galleries_id: this.get('gallery_id'),
          url : $.cookie('image')
      	}
  		  newImage = this.store.createRecord('image', data);

      	// Save the new model
      	newImage.save();
        
      	toastr.success('You have uploaded new image!');
      	this.set('title', '');
  	    this.set('description', '');
        $.removeCookie('image');
        this.transitionToRoute('/gallery/' + this.get('gallery_id'));
      }
    },

  }
});