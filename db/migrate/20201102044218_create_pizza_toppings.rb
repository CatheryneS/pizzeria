class CreatePizzaToppings < ActiveRecord::Migration[5.2]
  def change
    create_table :pizza_toppings do |t|
      t.references :pizza, foreign_key: true
      t.references :topping, foreign_key: true

      t.timestamps
    end
  end
end
