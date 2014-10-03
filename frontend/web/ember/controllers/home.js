// Home route
App.IndexRoute = App.LoadingRoute.extend({
	model: function() {
		return Ember.RSVP.hash({
          boycott: this.store.find('boycott'),
          boycottrank : this.store.find('boycottrank'),
          news: this.store.find('news'),
      });
	}
});

App.IndexController = Ember.ObjectController.extend({
 	
});

