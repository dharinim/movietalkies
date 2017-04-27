class ReviewsController < ApplicationController
  include SessionsHelper

  def create
    ratingInfo = params["ratingInfo"]
    reviewText = params["reviewText"]
    puts params
    user = current_user

    if user.nil?
      return render :unauthorized, :layout => false, :status => 401
    end

    Review.create(
      rating: ratingInfo["rating"],
      comment: reviewText,
      movie_id: ratingInfo["movieId"],
      user_id: user.id,
      review_date: Time.now.to_s(:db)
    )

    render :new, :layout => false
  end
end