App.UsersRoute = App.AuthenticatedRoute.extend({
  model: function() {
    //return this.store.find('user');
  }
});

// Get user by id
App.UserRoute = App.AuthenticatedRoute.extend({
  model: function(params) {
    return this.store.find('user', params.user_id);
  },
  setupController: function(controller, model) {
    if (model.get('id') == App.AuthManager.get('apiKey.user')) {
      this.transitionTo('myaccount');
    }
    else {
      this.controller.set('model', model);
    }
  }
});

// user controller
App.UserController = Ember.ObjectController.extend({
});