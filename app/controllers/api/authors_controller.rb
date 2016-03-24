class Api::AuthorsController < ApplicationController
  require 'open-uri'

  def index
    @authors = Author.all.order("last_name asc")
  end

  def show
    @author = Author.find_by id: params[:id]
  end

  def create
    @author = Author.new author_params

    url = params[:author][:photo_url]
    if url.present?
      open(url, "rb") do |file|
        @author.photo = file
      end
    end

    if @author.save
      render :index
    else
      render json: {errors: @author.errors}, status: 422
    end
  end

  def update
    @author = Author.find_by id: params[:id]

    url = params[:author][:photo_url]
    if url.present?
      open(url, "rb") do |file|
        @author.photo = file
      end
    end

    if @author.update author_params
      render :show
    else
      render json: {errors: @author.errors}, status: 422
    end
  end

  def destroy
    @author = Author.find_by id: params[:id]
    @author.destroy
    head :ok
  end

  def author_params
    params.require(:author).permit(:first_name, :last_name, :bio, :photo)
  end
end
