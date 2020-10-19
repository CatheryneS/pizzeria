class CreatePizzas < ActiveRecord::Migration[5.2]
  def change
    create_table :pizzas do |t|
      t.string :name
      t.string :description
      t.string :size
      t.string :timestamps
      t.belongs_to :user
      
      t.timestamps
    end
  end
end
