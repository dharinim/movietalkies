class UsersController < ApplicationController
  include SessionsHelper

  before_action :require_user, only: [:index, :show]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.new
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

