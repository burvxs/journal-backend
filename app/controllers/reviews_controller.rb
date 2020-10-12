class ReviewsController < ApplicationController
  def create
    created_review = Review.create(:weekly_review => params[:weekly_review])

    render json: created_review
  end

  def index
  end
end
