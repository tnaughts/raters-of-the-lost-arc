class ReviewsController < ApplicationController

  def new
    ensure_login!
    @review = Review.new
  end

  def create
    @review = Review.new(params[:review].permit(:headline, :stars, :content))
    @film = Film.find(params[:id])
    @review.reviewer_id = session[:user_id]

    if @review.save
      @film.reviews << @review
      redirect_to @film
    else
      render 'new'
    end
  end

  def show
    # @film = Film.find(params[:film_id])
    @review = Review.find(params[:id])
  end

end
