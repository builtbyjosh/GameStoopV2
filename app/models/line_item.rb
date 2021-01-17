class LineItem < ApplicationRecord
    belongs_to :cart
    belongs_to :game
    # belongs_to :user, through: :carts
    validates :quantity, presence: true
    
end
