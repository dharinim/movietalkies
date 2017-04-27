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
    });


    $("#new_user").on("ajax:success", function (e, data, status, xhr){
      console.log("success")
      $("#new_user")[0].reset();
    });

    // $("#new_user").on("ajax:error", function (e, data, status, xhr){
    //   console.log("error")
    //   $("#new_user")[0].reset();
    // });


    // $("#new_user").on("ajax:complete", function (e, data, status, xhr){
    //   console.log("complete")
    //   $("#new_user")[0].reset();
    // });

 
    // $("#testme").on("ajax:success", function (e, data, status, xhr) {
    //     alert("sdF");
    // });
    
    $(".reviewMe").click(function (e, obj) {
      var imageURL = $(this).parent().parent().find(".img-responsive_new").attr("src");
      var movieID = $(this).parent().parent().find("#movieListId").val();
      $("#randomReviewMovieId").val(movieID);
      $("#currentReviewPoster").attr("src", imageURL);

            var elem = $("#about");
            var posi = elem.offset().top-elem.innerHeight();
            $('body').animate({
                    scrollTop: posi + 920
                }, 1000);


      // $(this).scrollTop($("#about").position().top;
    });

    $("#testme").submit(function (e) {
      e.preventDefault();
      $.ajax({
        url: "/search?q="+ $("#searchQuery").val(),
        dataType: "html",
        success: function (data) {
          $("#searchResults").html(data);
          // Rebind review action
          $(".reviewMe").click(function (e1, obj) {
            e1.preventDefault();
            var imageURL = $(this).parent().parent().find(".img-responsive_new").attr("src");
            var movieID = $(this).parent().parent().find("#movieListId").val();
            $("#randomReviewMovieId").val(movieID);
            $("#currentReviewPoster").attr("src", imageURL);
            
            var elem = $("#about");
            var posi = elem.offset().top-elem.innerHeight();
            $('body').animate({
                    scrollTop: posi + 920
                }, 1000);

            
            
          });

        }
      })
    });

    var ratingInfo = {};

    $("#ratingMsg").hide();
    $("#reviewForm").submit(function (e) {
      e.preventDefault();
      $.ajax({
        url: "/review",
        dataType: "html",
        method: "POST",
        data: {
          ratingInfo: ratingInfo,
          reviewText: $("#reviewText").val()
        },
        success: function (data) {
          //alert(data);
          $("#ratingMsg").show({
            duration: 1000
          });
          setTimeout(function (){
            $("#ratingMsg").hide({
              duration: 1000
            });
          }, 5000);
        }
      })
    });
    
    $("#ratingContainer").starRating({
        totalStars: 5,
        starShape: 'rounded',
        starSize: 40,
        emptyColor: 'lightgray',
        hoverColor: '#fed136',
        activeColor: 'green',
        useGradient: false,
        disableAfterRate: false,
        callback: function(currentRating, er) {
          alert(currentRating);
          ratingInfo = {
            movieId: $("#randomReviewMovieId").val(),
            rating: currentRating
          }
        }
    })

      // $("#testme").submit(function (e) {
      //     e.preventDefault();
      //     $(ajax).get({
      //       url: "/search",
      //     }).on("success", function(e, data) {
      //       //if html
      //       //$("#newdiv").html(data);

      //       // if json
      //       content = ""
      //       for (i=0;i<data.ength; i++) {
      //           content = content + "<tr>" + data[pi] + "</tr>"

      //       }



      //       $("#newdiv").html(content)
      //     })
      // });
  
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

