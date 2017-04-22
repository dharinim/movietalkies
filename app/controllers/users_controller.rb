class UsersController < ApplicationController
  include SessionsHelper

  before_action :require_user, only: [:index, :show]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
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
      # session[:user_id] = @user.id
      # redirect_to '/'
      # flash[:success] = "Welcome"
      redirect_to @user, notice: 'User was successfully created.'
    else
      # redirect_to '/signup'
      render 'new'
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
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end

