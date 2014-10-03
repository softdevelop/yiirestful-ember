App.Gamification = DS.Model.extend({
	target: DS.attr('string'),
	reason: DS.attr('string'),
	points: DS.attr('number'),

	user: DS.belongsTo('user'),
});