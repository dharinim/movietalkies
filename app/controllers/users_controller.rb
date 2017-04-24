class UsersController < ApplicationController
  include SessionsHelper

  before_action :require_user, only: [:index, :show]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.new
    @recent_reviews = Review.order(review_date: :desc).limit(6)
    # @poster
    # @movie_name
    # @review 
    @movie_details = {
      name: [],
      poster: [],
      review: []
    }
    for i in 0..@recent_reviews.length-1
      p "printing movie_details"
      movie = Movie.find(@recent_reviews[i].movie_id)
      movie_name = movie.original_title
      movie_poster = movie.poster_path
      p movie_name, movie_poster
      @movie_details[:name] << movie_name
      @movie_details[:poster] << movie_poster
      @movie_details[:review] << @recent_reviews[i].comment
      p @movie_details
    end
  end
  
  def show
  end

  def new
    @user = User.new
  end
  
  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      respond_to do |format|
        puts "REANDING ************"
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.js { render json: {:first_name => @user.first_name }}
      end
    else
      render html: '<div>DAATA not saved</div>'.html_safe
    end
  end
  
  def update
    if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.' 
    else
        render :edit 
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.' 
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    p "printing params"
    p params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end

