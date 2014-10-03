// create new date type for model
App.DateStringTransform = DS.Transform.extend({
  serialize: function(value) {
    return value;
  },
  deserialize: function(value) {
  	var date = new Date(value);
	var dateString = moment(date).format("YYYY-MM-DD");
    return dateString;
  }
});

DS.JsonTransform = DS.Transform.extend({
  deserialize: function(serialized) {
  	return serialized;
  },

  serialize: function(deserialized) {
  	return deserialized;
  }
});

App.register("transform:json", DS.JsonTransform);
