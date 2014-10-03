App.Userprofile = DS.Model.extend({
	birthday: DS.attr('dateString'),
	profile_picture: DS.attr('string'),
	bio: DS.attr('string'),
	name: DS.attr('string'),
	surname: DS.attr('string'),
	comment: DS.attr('string'),
	total: DS.attr('number'),
	user: DS.belongsTo('user'),
});