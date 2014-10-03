// My account route
App.MyaccountRoute = App.AuthenticatedRoute.extend({
  model: function() {
    if (App.AuthManager.get('apiKey.user') != undefined)
      return Ember.RSVP.hash({
          user: this.store.find('user', App.AuthManager.get('apiKey.user')),
          profile: this.store.find('userprofile', {sd_users_id: App.AuthManager.get('apiKey.user')}).then(function(res){ return res.get('firstObject');}),
          boycottsigned: this.store.find('boycottsigned', {sd_users_id: App.AuthManager.get('apiKey.user')}),
          boycottcreated: this.store.find('boycottcreated', {sd_users_id: App.AuthManager.get('apiKey.user')}),
      });
  }
});


// my account controller
App.MyaccountController = Ember.ObjectController.extend({
  isEditing: false,
  isEditingPicture: false,
  avatar: false,

  // check if owner
  author: function(){
    return this.get('user').id == App.AuthManager.get('apiKey.user');
  }.property('App.AuthManager.apiKey'),

  actions: {
    // Enter edit user profile
    edit: function() {
      this.set('isEditing', true);
    },

    // Cancel edit user profile
    cancel: function(){
      this.get('profile').rollback();
      this.set('isEditing', false);
    },

    // Submit edit user profile
    doneEditing: function() {
      this.set('isEditing', false);
      profile = this.get('profile');
      profile.save();
    },

    // Enter edit user profile picture
    editPicture: function(){
      this.set('isEditingPicture', true);
    },

    // Submit edit user profile picture
    doneEditPicture: function() {
        var id = $('#changeProfileImage input#id').val();
        var self = this;
        $.ajaxFileUpload({
          url:'/userprofile/picture',
          secureuri:false,
          fileElementId:'fileToUpload',
          dataType: 'json',
          data:{id:id},
          success: function (data)
          {
            self.set('avatar', data.Userprofile.profile_picture);
            self.set('isEditingPicture', false);
            toastr.success('Your account info was saved!');
          },
          error: function()
          {
            toastr.error('An error appears! Please try again.');
          }
      })
    },

    // Cancel edit user profile picture
    cancelPicture: function(){
      this.set('isEditingPicture', false);
    },

    delete: function(){
      var user = this.get('model');
      user.deleteRecord();
      user.save();
      this.transitionTo('users');
    }
  }
});