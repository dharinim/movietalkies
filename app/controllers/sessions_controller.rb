class SessionsController < ApplicationController
  include SessionsHelper

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      login(@user)
      redirect_to '/'
    end
  end

  def destroy
    log_out
    redirect_to '/'
  end
end