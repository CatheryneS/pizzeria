class UsersController < ApplicationController
     before_action :find_user, only: [:show, :edit, :update, :delete]
    
    def index
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        redirect_to user_path(@user) 
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

    def find_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :phone, :password)
    end
end
