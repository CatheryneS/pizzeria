class PizzasController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index, :show]
  before_action :find_pizza, only: [:show, :edit, :update]
  
  def index
    @pizzas = Pizza.admin_pizzas 
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

  def delete
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

  def require_login
    redirect_to login_path unless session.include? :user_id
  end
end
