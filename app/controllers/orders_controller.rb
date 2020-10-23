class OrdersController < ApplicationController

    def new
        @order = Order.new
    end

    def create 
        @order = current_user.orders.build(order_params)
        add_pizzas(params[:order][:pizza_ids])

        if @order.valid?
            @order.save
            redirect_to user_orders_path(@order.user_id)
        else
            render :new
        end
    end

    private

    def order_params
        params.require(:order).permit(:note, :pizza_id)
    end

    def add_pizzas(pizzas)
        pizzas.each do |pizza_id|
            if !pizza_id.empty?
                pizza = Pizza.find_by_id(pizza_id)
                @order.pizzas << pizza
            end
        end
    end
end
