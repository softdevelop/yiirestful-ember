App.User = DS.Model.extend({
	username: DS.attr('string'),
	password_hash: DS.attr('string'),
	email: DS.attr('string'),
	created_at: DS.attr('number'),

	userprofile: DS.belongsTo('userprofile'),
	gamifications: DS.hasMany('gamification'),
	badgeandchallenges: DS.hasMany('badgeandchallenge'),
});