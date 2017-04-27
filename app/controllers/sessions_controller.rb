class SessionsController < ApplicationController
  include SessionsHelper
  # def new
  # end

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      # session[:user_id] = @user.id
      # redirect_to '/'
      login(@user)
      redirect_to '/'
    # else
      # redirect_to 'login'
      # flash[:danger] = "Invalid email and/or password."
      # redirect_to login_url, notice: 'Invalid email and/or password.'
    end
  end

  def destroy
    # session[:user_id] = nil
    log_out
    redirect_to '/'
  end
end

# class SessionsController < ApplicationController
#   include SessionsHelper
#   def create
#     @user = User.find_by_email(params[:session][:email])
#     if @user && @user.authenticate(params[:session][:password])
#       # session[:user_id] = @user.id
#       # redirect_to '/'
#       login(@user)
#       redirect_to '/'
#     else
#       # redirect_to 'login'
#       # flash[:danger] = "Invalid email and/or password."
#       redirect_to login_url, notice: 'Invalid email and/or password.'
#     end
    
#   end

#   def destroy
#     log_out
#     redirect_to root_url
#   end

# end