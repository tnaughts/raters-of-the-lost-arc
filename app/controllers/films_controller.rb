class FilmsController < ApplicationController
  def index
    @films = Film.all.order(:title)
  end

  def show
    @film = Film.find(params[:id])
  end

  def main_page
    @top = top_movies
    @reviews = recent_reviews
  end
end
