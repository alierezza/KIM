// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.


//= require jquery
//= require bootstrap.min
//= require moment.js
//= require datetimepicker.js
//= require jquery_ujs
//= require bootstrap-growl.min
//= require raphael-min.js
//= require morris.min.js

// require_tree .
function global_notif(textfield, types){
  $.growl(textfield, { type: types, animate: {
    enter: 'animated fadeInRight',
    exit: 'animated fadeOutRight'
    },
      allow_dismiss: false
  });
}

$(function(){
	$(".date").datetimepicker({
    pickTime: false,
    format: "DD/MM/YYYY"
  });
  $(".datetime").datetimepicker({
    pickDate: false
  });
})