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
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require react
//= require react_ujs
//= require components

$(function() {
  // remove flash notices
  $(document).on('turbolinks:load', function() {
    setTimeout(function() {
      $("#notice").fadeOut();
    }, 3500);
  });
  
  // auto submit hidden form when file selected
  $("#upload-field").change(function() {
    $("#upload-form").submit();
  });

  // upload button proxy for hidden form
  $("#upload-btn-proxy").click(function() {
    $("#upload-field").click();
  });
});
