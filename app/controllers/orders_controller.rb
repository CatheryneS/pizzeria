class OrdersController < ApplicationController
    before_action :require_login

    def new
        @order = Order.new
    end

    def create 
        @order = current_user.orders.build(order_params)

        if @order.valid?
            @order.save
            redirect_to user_orders_path(@order.user_id)
        else
            render :new
        end
    end

    private

    def order_params
        params.require(:order).permit(:note, pizza_ids: [])
    end

end
