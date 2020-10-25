class ReviewsController < ApplicationController
    before_action :require_login, :find_review
    skip_before_action :require_login, only: [:index, :show]

    def index
        if params[:pizza_id] && @pizza = Pizza.find_by(id: params[:pizza_id])
            @reviews = @pizza.reviews
        else
            @reviews = Reviews.all
        end
    end

    def new
        if params[:pizza_id] && @pizza = Pizza.find_by(id: params[:pizza_id])
            @review = @pizza.reviews.build
        else
            flash[:error] = "Login to leave a review."
            redirect_to pizza_paths(params[:pizza_id])
        end
    end

    def create
        @review = current_user.reviews.build(review_params)
        if @review.valid?
            @review.save
            flash[:success] = "Review created!"
            redirect_to pizza_path(params[:pizza_id])
        else
            render 'reviews/new'
        end
    end

    def show
    end

    def edit
    end

    def update
    end

    def delete
    end

    private

    def review_params
        params.require(:review).permit(:rating, :content, :pizza_id)
    end

    def find_review
        @review = Review.find_by(id: params[:id])
    end
end
