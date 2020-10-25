class OrdersController < ApplicationController
    before_action :require_login
    before_action :find_order, only: [:show, :edit, :update, :destroy]

    def new
        @order = Order.new
        3.times{@order.pizzas.build}
    end

    def create 
        @order = current_user.orders.build(order_params)
        @order.status = "In Progress"
        if @order.valid?
            @order.save
byebug
            flash[:success] = "Your order has been placed."
            redirect_to user_orders_path(@order.user_id)
        else
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
