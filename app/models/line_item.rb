class LineItem < ApplicationRecord
    belongs_to :carts
    belongs_to :games
    
end
