class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:email]
    @user = User.find_by_email(email)

    if @user
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :create
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
