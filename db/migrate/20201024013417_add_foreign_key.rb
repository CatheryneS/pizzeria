class AddForeignKey < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :orders, column: :pizza_id
    add_foreign_key :orders, column: :user_id
  end
end
