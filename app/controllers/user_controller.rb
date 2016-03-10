class UserController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]

    if @user.save
      session[:user_id] = @user.id
      redirect_back_or_default root_path
    else
      render :new
    end
  end
end
