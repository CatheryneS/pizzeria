class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true
    validates :email, uniqueness: true, presence: true
    validates :phone, uniqueness: true

    has_many :pizzas #pizzas created by the user
    has_many :orders #orders placed
end
