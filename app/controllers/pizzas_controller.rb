class PizzasController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]
  before_action :find_pizza, only: [:show, :edit, :update, :destroy]
  
  def index
    @pizzas = Pizza.query(params[:query])
    if logged_in?
      @user = current_user
    end
  end

  def new
    @pizza = Pizza.new
  end

  def create
    @pizza = Pizza.new(pizza_params)
      if @pizza.valid?
        @pizza.save
        redirect_to pizzas_path
      else
        render :new
      end
  end

  def show
  end

  def edit
  end

  def update
    if current_user == @pizza.user
      @pizza.update(pizza_params)
      flash[:success] = "Your pizza has been updated."
      redirect_to pizza_path(@pizza)
    else
      flash[:error] = "You can only update your pizza creations."
      redirect_to pizzas_path
    end 
  end

  def destroy
    @pizza.destroy
    flash[:success] = "Your pizza has been trashed."
    redirect_to user_path(current_user)
  end

  private

  def pizza_params
    params.require(:pizza).permit(:name, :description, :size, :user_id)
  end

  def find_pizza
    @pizza = Pizza.find_by(id: params[:id])
    if @pizza.nil?
      flash[:error] = "Sorry we couldn't find that pizza."
      redirect_to pizzas_path 
    end
  end
end
