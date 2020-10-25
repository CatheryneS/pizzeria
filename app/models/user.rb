class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true
    validates :email, uniqueness: true, presence: true
    validates :phone, numericality: true, allow_blank: true

    has_many :pizzas, dependent: :destroy #pizzas created by the user
    has_many :orders, dependent: :destroy #orders placed 
    has_many :reviews, dependent: :destroy
end
