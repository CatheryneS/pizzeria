class ReviewsController < ApplicationController
    # before_action :require_login

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
            @review = Review.new
        end
    end

    def create
        byebug
    end

    def show
    end

    def edit
    end

    def update
    end

    def delete
    end
end
