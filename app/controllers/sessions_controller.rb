class SessionsController < ApplicationController
  # GET route for Login
  def new
    @user = User.new
  end

  # POST route for Login
  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:current_user_id] = @user.id
      redirect_to root_url, notice: "#{@user.username} is logged in!"
    else
      flash.now.alert = 'Email or Password is invalid.'
      render :new
    end
  end

  # DELETE route for Logout
  def destroy
    current_user = session[:current_user_id] = nil
    redirect_to root_url, notice: "You are logged out!"
  end
end
