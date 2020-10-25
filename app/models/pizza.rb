class Pizza < ApplicationRecord
    belongs_to :user
    has_many :order_pizzas
    has_many :orders, through: :order_pizzas
    has_many :reviews

    validates :description, presence: true
    validates :name, presence: true, uniqueness: true
end
