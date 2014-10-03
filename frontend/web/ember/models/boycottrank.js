App.Boycottrank = DS.Model.extend({
	title: DS.attr('string'),
	target_type: DS.attr('string'),
	description: DS.attr('string'),
	demand: DS.attr('string'),
	product : DS.attr('json'),
	sd_products_id: DS.attr('number'),

});