class Cart < ApplicationRecord
    
    has_many :line_items
    has_many :games, through: :line_items
    belongs_to :user

    def cart_total
        self.line_items.sum do |item|
            item.subtotal
        end
    end
end
