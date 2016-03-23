class SessionController < ApplicationController
  def new
  end

  def create
    email = params[:email]
    password =  params[:password]
    @user = User.find_by email: email
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      redirect_back_or_default root_path
    else
      render :new
    end
  end

  def delete
    session[:user_id] = nil
    redirect_to root_path
  end
end
