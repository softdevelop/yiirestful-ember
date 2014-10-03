App.News = DS.Model.extend({
	title: DS.attr('string'),
	content: DS.attr('string'),
	created_at: DS.attr('number'),
});