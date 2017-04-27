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
      alert("Your account has been created. Please login");
    });
    
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
    });

    $("#testme").submit(function (e) {
      e.preventDefault();
      $.ajax({
        url: "/search?q="+ $("#searchQuery").val(),
        dataType: "html",
        success: function (data) {
          $("#searchResults").html(data);
          $("#searchButton").removeAttr("disabled").attr('value', 'SEARCH AND REVIEW');
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
    $("#unauthorizedMsg").hide();
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
        },
        statusCode: {
          401: function() {
            $("#unauthorizedMsg").show({
              duration: 1000
            });
            setTimeout(function (){
              $("#unauthorizedMsg").hide({
                duration: 1000
              });
            }, 5000);
          }
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
          ratingInfo = {
            movieId: $("#randomReviewMovieId").val(),
            rating: currentRating
          }
        }
    })
});