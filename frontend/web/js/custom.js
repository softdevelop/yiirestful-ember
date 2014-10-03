// $(document).ready(function(){
//     $('#ember-app').on('submit', '#changeProfileImage', function(e){
//     	e.preventDefault();
//     	var data = new FormData();
//     	data.append('file', $('#file')[0].files[0]);
//     	var formURL = $(this).attr("action");

// 	    $.ajax({
// 		  url: formURL,
// 		  data: data,
// 		  processData: false,
// 		  type: 'POST',
// 		  success: function(data){
// 		    alert(data);
// 		  }
// 		});
//     });
// });