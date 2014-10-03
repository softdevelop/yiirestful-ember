
// convert safe string
var showdown = new Showdown.converter();

Ember.Handlebars.helper('format-markdown', function(input) {
  return new Handlebars.SafeString(showdown.makeHtml(input));
});


// format date using fromnow
Ember.Handlebars.helper('format-date', function(date) {
	date = new Date (date*1000);
  	return moment(date).fromNow();
});

// Using datepicker for input
App.DatePickerView = Ember.TextField.extend({
    didInsertElement: function() {
        this.$().fdatepicker({
			format: 'yyyy-mm-dd'
		});
    }
});

Ember.Handlebars.helper('date-picker', App.DatePickerView);


// file upload component
App.FileUploadComponent = Ember.FileField.extend({
  url: '',
  filesDidChange: (function() {
	$.removeCookie('image');
    var uploadUrl = this.get('url');
    var files = this.get('files');

    var uploader = Ember.Uploader.create({
      url: uploadUrl
    });

    if (!Ember.isEmpty(files)) {
    	Ember.$('.loader').addClass('show');
      	var promise = uploader.upload(files[0]);

		promise.then(function(data) {
		  Ember.$('.loader').removeClass('show');
		  // Handle success
		  result = JSON.parse(data);
		  if (result.error){
		  	toastr.error(result.message);
		  }
		  else{
		  	toastr.success('Your image is ready to save!');
		  	$.cookie('image', result.url);
		  }
		}, function(error) {
		  // Handle failure
		  toastr.error('Some errors appear! Please select your image again!');
		});
    }
  }).observes('files')
});

