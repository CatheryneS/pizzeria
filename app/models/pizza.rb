class Pizza < ApplicationRecord
    belongs_to :user
    has_many :order_pizzas
    has_many :orders, through: :order_pizzas
    has_many :reviews, dependent: :destroy

    validates :description, presence: true
    validates :name, presence: true, uniqueness: true

    scope :admin_pizzas, -> {where(:user_id => 1)}

    def self.query(pizza)
        if pizza
            @pizzas = Pizza.all.where('name LIKE :pizza', pizza: "%#{pizza}%")
        else
            @pizzas = Pizza.admin_pizzas
        end
    end
end