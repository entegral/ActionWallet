class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You've successfully signed up!"
      session[:user_id] = @user.id
      redirect_to "/"
    else
      flash[:alert] = "There was a problem signing up. Make sure that your passwords match"
      redirect_to '/signup'
    end
  end
  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end

def show
end
