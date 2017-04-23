// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$.ajaxSettings.dataType = "json";
$(document).ready(function(){
    $("#new_user").submit(function(e){
    e.preventDefault();
    
    $("#new_user").on("ajax:success", function (e, data, status, xhr){
      console.log("success")
      $("#new_user")[0].reset();
    });

    $("#new_user").on("ajax:error", function (e, data, status, xhr){
      console.log("error")
      $("#new_user")[0].reset();
    });


    $("#new_user").on("ajax:complete", function (e, data, status, xhr){
      console.log("complete")
      $("#new_user")[0].reset();
    });

 
  });
  // .done(function(){console.log("dfsfsdf")

  //   $(this)[0].reset();
  // });
    // $("#new_user").on("ajax:success", function (e, data, status, xhr){
  //     console.log("jhbjkhk")
  //   $("#new_user")[0].reset();
  // });
});

// $.ajaxSettings.dataType = "json";
// $(document).ready(function (){
//   $("#new_attendance").on("ajax:success", function (e, data, status, xhr){
//     $('#ateendee-list').append($("<li>" + data.first_name + "</li>"));
//     $("#attendance-add").hide()
//   });
//   $("#new_attendance").on("ajax:error", function (e, xhr, status, error){
//     alert(error);
//   });
// })

