class Order < ApplicationRecord
    belongs_to :user
    has_many :order_pizzas
    has_many :pizzas, through: :order_pizzas

    def pizza_ids=(pizza_ids)
       pizza_ids.each do |pizza_id|
        self.pizzas << Pizza.find_by(id: pizza_id) unless pizza_id.empty?
       end
    end
end
