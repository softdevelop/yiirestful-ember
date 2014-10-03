// Ember app init
App = Ember.Application.create({
  rootElement: '#ember-app'
});

App.ApplicationRoute = Ember.Route.extend({
  store: this.store,
  init: function() {
    this._super();
    App.AuthManager = AuthManager.create();
    //App.FileUploadComponent = FileUploadComponent.create();
  },
  events: {
    logout: function() {
      App.AuthManager.reset();
      this.transitionTo('index');
    }
  }
});

App.ApplicationController = Ember.Controller.extend({
  currentUser: function() {
    return App.AuthManager.get('apiKey.user');
  }.property('App.AuthManager.apiKey'),

  isAuthenticated: function() {
    return App.AuthManager.isAuthenticated();
  }.property('App.AuthManager.apiKey')
});

// Ember route
App.Router.map(function() {
  this.resource('register');
  this.resource('login');
  this.resource('users', function() {
    this.resource('user', { path: ':user_id' });
  });
  this.resource('myaccount');
  this.resource('logout');
  this.resource('about');
  this.resource('thankyou');
  this.resource('galleries');
  this.resource('gallery', { path: '/gallery/:gallery_id' });
  this.resource('newimage', { path: '/newimage/:gallery_id' });
  this.resource('image', { path: '/image/:image_id' });
  // this.resource('news', function() {
  //   this.resource('newdetails', { path: ':news_id' });
  // });
  this.resource('news', { path: '/news/:news_id' });
});

// Ember store, define server url here to use ember REST
DS.RESTAdapter.reopen({
  host: 'http://restadvancelocal.com',
});