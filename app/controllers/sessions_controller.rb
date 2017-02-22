class SessionsController < ApplicationController
  def new
    
  end
  
  def create
    if @user = User.find_by(email: params[:email])
    if @user.authenticate(params[:password]) # check if password is correct
      # handle logging in
      session[:user_id] = @user.id
      flash[:success] = "Logged in successfully!"
      redirect_to users_path
    else
      # handle "invalid password"
      flash[:error] = "Invalid password!"
      render 'new'
    end
    else
      # handle "user not found"
      flash[:error] = "User not found!"
      render :new
    end
  end

  def destroy
  end
end
