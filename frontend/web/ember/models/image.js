App.Image = DS.Model.extend({
	title: DS.attr('string'),
	description: DS.attr('string'),
	owner: DS.attr('string'),
	created_at: DS.attr('string'),
	sd_galleries_id: DS.attr('number'),
	url: DS.attr('string'),

	gallery: DS.belongsTo('gallery')
});