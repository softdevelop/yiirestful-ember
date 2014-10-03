App.Boycottsigned = DS.Model.extend({
	title: DS.attr('string'),
	text: DS.attr('string'),
	image: DS.attr('string'),
	string_id: DS.attr('string'),
	type: DS.attr('number'),
	target_type: DS.attr('string'),
	description: DS.attr('string'),
	demand: DS.attr('string'),
	sd_products_id: DS.attr('number'),
	money_spend: DS.attr('number'),

	user: DS.belongsTo('user'),
});