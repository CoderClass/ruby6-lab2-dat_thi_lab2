class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "User created successfully!"
      session[:user_id] = @user.id
      redirect_to users_path
    else
      flash[:error] = "Error: #{@user.errors.full_messages.to_sentence}"
      redirect_to new_user_path
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :imgage_url)
  end

end
