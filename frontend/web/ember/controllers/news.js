App.NewsRoute = Ember.Route.extend({
  model: function(params) {
    return this.store.find('news', params.news_id);
  }
});


App.NewsController = Ember.ObjectController.extend({
 	
});
