class BooksController < ApplicationController
  before_action except: [:index] do
    @current_user = User.find_by id: session[:user_id]
    if @current_user.blank?
      redirect_to sign_in_path
    end
  end

  def index
    user_id = session[:user_id]
    if user_id.present?
      @current_user = User.find_by id: user_id
    end

    @books = Book.all.order("title asc")
  end

  def show
    @book = Book.find_by id: params[:id]
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new
    @book.title = params[:book][:title]
    @book.photo_url = params[:book][:photo_url]
    @book.price = params[:book][:price]
    @book.author_id = params[:book][:author_id]

    if @book.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @book = Book.find_by id: params[:id]
  end

  def update
    @book = Book.find_by id: params[:id]
    @book.title = params[:book][:title]
    @book.photo_url = params[:book][:photo_url]
    @book.price = params[:book][:price]
    @book.author_id = params[:book][:author_id]

    if @book.save
      redirect_to book_path
    else
      render :edit
    end
  end

  def delete
    @book = Book.find_by id: params[:id]
    @book.destroy
    redirect_to root_path
  end
end
