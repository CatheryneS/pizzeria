class PizzasController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index, :show]
  before_action :find_pizza, only: [:show, :edit, :update]
  
  def index
    @pizzas = Pizza.all
  end

  def new
    @pizza = Pizza.new
  end

  def create
    @pizza = Pizza.new(pizza_params)
    byebug
      if @pizza.valid?
        @pizza.save
        redirect_to pizzas_path
      else
        render :new
      end
  end

  def show
  end

  def update
  end

  def delete
  end

  private

  def pizza_params
    params.require(:pizza).permit(:name, :description, :size)
  end

  def find_pizza
    @pizza = Pizza.find(params[:id])
  end

  def require_login
    redirect_to login_path unless session.include? :user_id
  end
end
