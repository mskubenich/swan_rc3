class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @logged_in_user = User.find(session[:user_id]) if logged_in?
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Uzhhorod web portal!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :full_name, :email, :password)
    end
end
