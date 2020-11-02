class OrdersController < ApplicationController
    before_action :find_order, only: [:show, :edit, :update, :destroy]

    def new
        @order = Order.new
        3.times{@order.pizzas.build.toppings.build}
    end

    def create 
        byebug
        @order = current_user.orders.build(order_params)
        @order.status = "In Progress"
        if @order.valid?
            @order.save
            flash[:success] = "Your order has been placed."
            redirect_to user_orders_path(@order.user_id)
        else
            3.times{@order.pizzas.build}
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if @order.update(order_params)
            flash[:success] = "Order notes have been updated."
            redirect_to order_path(@order)
        else
            render :edit
        end
    end

    def destroy
        @order.destroy
        flash[:success] = "Your order has been cancelled."
        redirect_to user_orders_path(current_user)
    end

    private

    def order_params
        params.require(:order).permit(:note, pizza_ids: [], pizzas_attributes: [:name, :description, :user_id, :id])
    end

    def find_order
        @order = Order.find_by(id: params[:id])
    end

end
