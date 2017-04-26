require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  describe "search" do
    before(:each) do
      @themoviedbdata = { 
              :flashcard  => @flashcard,
              :lesson     => @lesson,
              :success    => true
      }.to_json

      url("https://api.themoviedb.org/3/search/movie?") { {:body => @themoviedbdata.to_json} }
    end

    it "gets serach results from themoviedb" do
      get :search, format: :json

      @expected = { 
              :flashcard  => @flashcard
      }.to_json

      response.body.should == @expected
    end
  end
end
