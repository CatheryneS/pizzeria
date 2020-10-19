class Order < ApplicationRecord
    belongs_to :user
    belongs_to :pizza
end
