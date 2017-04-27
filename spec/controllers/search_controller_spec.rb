require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  describe "search" do
    render_views
    
    it "gets serach results from themoviedb" do
      get :search, {q: "beauty"}
      expect(response).to render_template("search")
      expect(response.body).to match /Beauty and the Beast/im
    end
  end
end
