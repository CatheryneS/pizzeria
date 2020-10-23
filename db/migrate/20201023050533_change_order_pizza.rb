class ChangeOrderPizza < ActiveRecord::Migration[5.2]
  def change
    rename_table :order_pizza, :order_pizzas
  end
end
