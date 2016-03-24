class Api::BooksController < ApplicationController
  require 'open-uri'

  def index
    @books = Book.all.order("title asc")
  end

  def show
    @book = Book.find_by id: params[:id]
  end

  def create
    @book = Book.new book_params

    url = params[:book][:photo_url]
    if url.present?
      open(url, "rb") do |file|
        @book.photo = file
      end
    end

    if @book.save
      render :index
    else
      render json: {errors: @book.errors}, status: 422
    end
  end

  def update
    @book = Book.find_by id: params[:id]

    url = params[:book][:photo_url]
    if url.present?
      open(url, "rb") do |file|
        @book.photo = file
      end
    end

    if @book.update book_params
      render :show
    else
      render json: {errors: @book.errors}, status: 422
    end
  end

  def destroy
    @book = Book.find_by id: params[:id]
    @book.destroy
    head :ok
  end

  def authors
    @authors = Author.all.order("last_name asc")
  end

  def book_params
    params.require(:book).permit(:title, :photo, :price, :author_id)
  end
end
