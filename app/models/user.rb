class User < ApplicationRecord
    has_secure_password
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, uniqueness: true, email: true
    validates :phone, presence: true

    # has_many :pizzas #pizzas created by the user
    has_many :orders
    # has_many :ordered_pizzas, through: :orders, source: :pizza
    has_many :pizzas, through: :order_pizzas
end
