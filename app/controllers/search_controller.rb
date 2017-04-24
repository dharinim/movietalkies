require 'net/http'

class SearchController < ApplicationController
  include SessionsHelper

  def new
  end

  def search
    query = "beauty"
    response = HTTParty.get('https://api.themoviedb.org/3/search/movie?api_key=bd68c036b87d2a4e8c836f04dd3a0a75&page=1&query='+ query)
    res = JSON.parse(response.body)

    respond_to do |format|
      format.js { render json: {:results => res}}
    end
  #   # Call themoviedb and get data
  #     <script type="text/javascript">
  #       $(document).on("turbolinks:load", ready);
  #       $(document).ready(ready);


  #       function ready(){
  #           $.ajax({
  #             url: '/search',
  #           }).done(function (result){
  #             console.log(result);

  #             # $('#calendar').fullCalendar({
  #             #   header: {
  #             #     left: 'prev,next today',
  #             #     center: 'title',
  #             #     right: 'month,agendaWeek,agendaDay,listWeek'
  #             #   },
  #             #   navLinks: true, // can click day/week names to navigate views
  #             #   editable: true,
  #             #   eventLimit: true, // allow "more" link when too many events
  #             #   events: result,
  #             #   eventDrop: function(event, delta, revertFunc) {
  #             #     var new_date = event.start.format('YYYY-MM-DD HH:mm:ss');
  #             #     var id = event.id;
  #             #     var postData = {
  #             #       new_date: new_date,
  #             #       appointment_id: id
  #             #     };
  #             #     updateAppointmentData(postData);
  #             #   }
  #             # });
  #           });
  #       }


  #       # function updateAppointmentData(postData) {
  #       #   $.ajax({
  #       #     url: '/appointments',
  #       #     method: 'POST',
  #       #     dataType: "json",
  #       #     contentType: "application/json; charset=utf-8",
  #       #     data: JSON.stringify(postData),
  #       #   }).done(function (res) {
            
  #       #   });
  #       # }
  # </script>
  end

  def create
  end

  def destroy
  end
end