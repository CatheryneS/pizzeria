class Order < ApplicationRecord
    belongs_to :user
    belongs_to :pizza, optional: true
end
