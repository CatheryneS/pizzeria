class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :delete]
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]

    def index
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            redirect_to login_path
        else
            render :new
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

    def find_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :email, :phone, :password, :password_confirmation)
    end
end
