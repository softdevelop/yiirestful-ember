App.Badgeandchallenge = DS.Model.extend({
	title: DS.attr('string'),
	text: DS.attr('string'),
	image: DS.attr('string'),
	string_id: DS.attr('string'),
	type: DS.attr('number'),
	points: DS.attr('number'),

	user: DS.belongsTo('user'),
});