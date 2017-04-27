require 'test_helper'

class ReviewControllerTest < ActionDispatch::IntegrationTest
  test "cannot review without logging in" do
    post "/review"
    assert_select "div", "Please login to review the movie"
  end
end
