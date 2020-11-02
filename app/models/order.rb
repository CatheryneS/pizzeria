class Order < ApplicationRecord
    belongs_to :user
    has_many :order_pizzas
    has_many :pizzas, through: :order_pizzas
    validate :pizzas_in_order

    # handels adding pizzas to order through order_pizzas join table
    def pizza_ids=(pizza_ids)
       pizza_ids.each do |pizza_id|
        self.pizzas << Pizza.find_by(id: pizza_id) unless pizza_id.empty?
       end
    end

    def pizzas_attributes=(attributes)
        attributes.values.each do |attr|
            self.pizzas << Pizza.find_or_create_by(attr) unless attr[:name].empty? && attr[:description].empty?
        end
    end

    def pizzas_in_order
        if self.pizzas.empty?
            errors.add(:order, "must have at least one pizza added.")
        end
    end
end
