class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.belongs_to :user
      t.belongs_to :pizza
      t.string :status
      t.string :note

      t.timestamps
    end
  end
end
