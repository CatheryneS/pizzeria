class User < ApplicationRecord
    has_secure_password
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, uniqueness: true, email: true
    validates :phone, presence: true

    has_many :pizzas
end
