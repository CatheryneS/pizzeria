class OrderPizza < ActiveRecord::Migration[5.2]
  def change
    create_table :order_pizza do |t|
      t.belongs_to :order
      t.belongs_to :pizza

      t.timestamps
    end
  end
end
