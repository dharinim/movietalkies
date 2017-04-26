require 'net/http'

class SearchController < ApplicationController
  include SessionsHelper
  include SearchHelper
  def new
  end

  def search
    query = params["q"]

    @movies_list = search_movie_list(query)
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