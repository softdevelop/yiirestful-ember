// Login route
App.LoginRoute = Ember.Route.extend({
  beforeModel: function(transition) {
    Ember.$('.loader').removeClass('show');
  },
  model: function() {
    return Ember.Object.create();
  }
});

// Login controller
App.LoginController = Ember.ObjectController.extend({
  content: {},

  // initial loading when first enter login
  reset: function(){
    this.setProperties({
      errorMessage: "",
    })
  },
  actions: {

    // handle login. Get username and password and send to server validate.
    // Then save access token and user id 
    loginUser: function() {
      this.reset();
      var self = this;
      var store = this.store;
      var router = this.get('target');
      var data = this.getProperties('username', 'password');
      var attemptedTrans = this.get('previousTransition');
      var error = false;

      if (data['username'] == "" || data['username'] == undefined){
        error = true;
        self.set('errorUsername', 'Username field is required');
      }

      if (data['password'] == "" || data['password'] == undefined){
        error = true;
        self.set('errorPassword', 'Password field is required');
      }

      if (!error){
        Ember.$('.loader').addClass('show');
        $.post('/login', data, function(results) {
          Ember.$('.loader').removeClass('show');
          results = JSON.parse(results);
          if (results.error){
            self.set('errorMessage', 'Incorrect username or password.');
          }
          else{
            App.AuthManager.authenticate(results.api_key.access_token, results.api_key.user_id);
            if (attemptedTrans) {
              attemptedTrans.retry();
              self.set('attemptedTransition', null);
            } else {
              router.transitionTo('myaccount');
            }
          }
        });
      }
    }
  }
});