class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
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
      params.require(:user).permit(:first_nale, :last_name, :full_name, :email, :password)
    end

  def user_params
  params.require(:user).permit(:name, :email, :password,
  :password_confirmation, :avatar)
  end
  def correct_user
  @user = User.find(params[:id])
  redirect_to(root_url) unless current_user?(@user)
  end
  def signed_in_user
  redirect_to signin_url, notice: "Please sign in." unless signed_in?
  end
end