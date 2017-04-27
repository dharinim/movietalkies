require 'net/http'

class SearchController < ApplicationController
  include SessionsHelper
  include SearchHelper
  
  def new
  end

  def search
    query = params["q"]
    @movies_list = search_movie_list(query)
    render :search, :layout => false
  end

  def create
  end

  def destroy
  end
end