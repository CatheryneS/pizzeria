class OrdersController < ApplicationController
    before_action :require_login

    def new
        @order = Order.new
        3.times{@order.pizzas.build}
    end

    def create 
        @order = current_user.orders.build(order_params)
        byebug
        if @order.valid?
            @order.save
            redirect_to user_orders_path(@order.user_id)
        else
            render :new
        end
    end

    private

    def order_params
        params.require(:order).permit(:note, pizza_ids: [], pizzas_attributes: [:name, :description, :user_id])
    end

end
