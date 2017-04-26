require 'net/http'

class SearchController < ApplicationController
  include SessionsHelper

  def new
  end

  def search
    query = params["q"]
    response = HTTParty.get('https://api.themoviedb.org/3/search/movie?api_key=bd68c036b87d2a4e8c836f04dd3a0a75&page=1&query='+ query)
    res = JSON.parse(response.body)

    @movies_list = []
    image_basepath = "https://image.tmdb.org/t/p/w300"
    

    max_limit = 9;

    if res["results"]
        results = res["results"]

        results.each do |result|
            @movies_list.push({
              poster: image_basepath + result["poster_path"],
              original_title: result["original_title"]
            })

            if @movies_list.length > max_limit - 1
              break
            end
        end
    end

    # IF sorting required
    # @search_movies = sort_by(@search_movies, params["key"])



    # respond_to do |format|
    #   format.js { render json: {:results => @movies_list}}
    #   format.json { render json: {:results => @movies_list}}
    # end
  #   # Call themoviedb and get data
    render :search, :layout => false
  end

  def create
  end

  def destroy
  end
end