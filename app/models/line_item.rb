class LineItem < ApplicationRecord
    belongs_to :cart
    belongs_to :game
    validates :quantity, presence: true
    
end
