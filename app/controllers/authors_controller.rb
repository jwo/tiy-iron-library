class AuthorsController < ApplicationController
  before_action do
    @current_user = User.find_by id: session[:user_id]
    if @current_user.blank?
      store_location
      redirect_to sign_in_path
    end
  end

  def index
    @authors = Author.all.order("last_name asc")
  end

  def show
    @author = Author.find_by id: params[:id]
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new author_params

    if @author.save
      redirect_to authors_path
    else
      render :new
    end
  end

  def edit
    @author = Author.find_by id: params[:id]
  end

  def update
    @author = Author.new

    if @author.update author_params
      redirect_to author_path
    else
      render :edit
    end
  end

  def destroy
    @author = Author.find_by id: params[:id]
    @author.destroy
    redirect_to authors_path
  end

  def author_params
    params.require(:author).permit(:first_name, :last_name, :bio, :photo)
  end
end
