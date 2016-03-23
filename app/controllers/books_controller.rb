class BooksController < ApplicationController
  before_action except: [:index] do
    @current_user = User.find_by id: session[:user_id]
    if @current_user.blank?
      store_location
      redirect_to sign_in_path
    end
  end

  def index
    @books = Book.all.order("title asc")
  end

  def show
    @book = Book.find_by id: params[:id]
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new book_params

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

    if @book.update book_params
      redirect_to book_path(id: @book.id)
    else
      render :edit
    end
  end

  def delete
    @book = Book.find_by id: params[:id]
    @book.destroy
    redirect_to root_path
  end

  def book_params
    params.require(:book).permit(:title, :photo, :price, :author_id)
  end
end
