class ReviewsController < ApplicationController
  before_action :authenticate_user!
  
  def create

    @studio = Studio.find(params[:studio_id])

    @review = Review.new(:studio_id => params[:studio_id], :stars => params[:review][:stars], :detail => params[:review][:detail])

    if @review.save
      redirect_to @studio
    else
      render "studios/show", status: :unprocessable_entity, locals: {review: @review, studio_id: params[:studio_id]}
    end

  end

  private
    def review_params
      params.require(:review).permit(:stars, :detail)
    end
end
