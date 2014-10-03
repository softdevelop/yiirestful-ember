
App.LoadingRoute = Ember.Route.extend({
  beforeModel: function(transition) {
    Ember.$('.loader').addClass('show');
  },
  afterModel: function() {
    Ember.$('.loader').removeClass('show');
  },
});


App.AuthenticatedRoute = App.LoadingRoute.extend({
  // check if user is logged in. If not redirect to login page
  beforeModel: function(transition) {
    this._super();
    if (!App.AuthManager.isAuthenticated()) {
      this.redirectToLogin(transition);
    }
  },
  // redirect to login
  redirectToLogin: function(transition) {
    var loginController = this.controllerFor('login');
    loginController.set('previousTransition', transition);
    this.transitionTo('login');
  },

  actions: {
    events: {
      // handle error with this route
      error: function(reason, transition) {
        if (reason.status === 401) {
          this.redirectToLogin(transition);
        } else {
          console.log('Something went wrong');
        }
      }
    }
  }
});
