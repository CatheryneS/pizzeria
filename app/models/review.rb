class Review < ApplicationRecord
  belongs_to :user
  belongs_to :pizza

  validates :content, presence: true, length: {maximum: 250} 
  validates :rating, presence: true, length: {minimum: 1}
end
