class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]
    skip_before_action :require_login, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            flash[:success] = "Your new account has been made. Please login."
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
        if logged_in?
            @user.update(user_params)
            flash[:success] = "Your account has been updated."
            redirect_to user_path(@user)
        else
            flash[:error] = "You must be logged in to access account."
            redirect_to root_path
        end
    end

    def destroy
        @user.destroy
        flash[:success] = "Your account has been terminated."
        redirect_to root_path
    end

    private

    def find_user
        @user = User.find_by(id: params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :email, :phone, :password, :password_confirmation)
    end
end
