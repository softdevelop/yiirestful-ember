// Register route. Initial new model user instance
App.RegisterRoute = Ember.Route.extend({
  setupController: function(controller, model) {
    this.controller.set('model', this.store.createRecord('user'));
  }
});

// Register controller
App.RegisterController = Ember.ObjectController.extend({
  // Initial loading when first enter register
  reset: function(){
    this.setProperties({
      errorEmail: "",
      errorUsername: "",
      errorPassword: "",
      errorconfirmPassword: "",
    })
  },

  // Register function. Get information and send to server
  // Then transition to thank you page
  createUser: function() {
    this.reset();
    self = this;
    store = this.store;
    var router = this.get('target');
    var data = this.getProperties('email', 'username', 'password', 'confirmPassword')
    var user = this.get('model');

    var error = false;
    if (data['email'] == undefined){
      error = true;
      self.set('errorEmail', 'Email field is required');
    }

    if (data['username'] == undefined){
      error = true;
      self.set('errorUsername', 'Username field is required');
    }

    if (data['password'] == undefined){
      error = true;
      self.set('errorPassword', 'Password field is required');
    }

    if (data['confirmPassword'] == undefined){
      error = true;
      self.set('errorconfirmPassword', 'Password field is required');
    }

    if (data['confirmPassword'] !== data['password']){
      error = true;
      self.set('errorPassword', 'Password must match');
      self.set('errorconfirmPassword', 'Password must match');
    }

    /*
    newUser = this.store.createRecord('user', data);

    var onSuccess = function(response) {
      this.set('username', '');
      this.set('password', '');
      this.set('email', '');
    };

    var onFail = function(response) {
      error = JSON.parse(response.responseText);
      $.each(error, function(i, item) {
          if (error[i]['field'] == 'username'){
            self.set('errorUsername', error[i]['message']);
          }

          if (error[i]['field'] == 'email'){
            self.set('errorEmail', error[i]['message']);
          }

          if (error[i]['field'] == 'password'){
            self.set('errorPassword', error[i]['message']);
          }
      });
      self.set('errorMessage', 'Can not register');
    };

    // Save the new model
    newUser.save().then(onSuccess, onFail);
    */

    if (!error){
      Ember.$('.loader').addClass('show');
      $.post('/users', { user: data }, function(results) {
        Ember.$('.loader').removeClass('show');
        results = JSON.parse(results);
        //App.AuthManager.authenticate(results.api_key.access_token, results.api_key.user_id, store);
        if (results.error)
          toastr.error('An error appears! please try again.');
        else
        {
          toastr.success('Register successfully!');
          router.transitionTo('thankyou');
        }
      })
      .fail(function() {
        toastr.error('An error appears! please try again.');
      });
    }
  }
});