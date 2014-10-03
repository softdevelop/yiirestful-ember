App.Gallery = DS.Model.extend({
	title: DS.attr('string'),
	description: DS.attr('string'),
	owner: DS.attr('string'),
	created_at: DS.attr('date'),

	images: DS.hasMany('image')
});