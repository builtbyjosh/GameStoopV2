class Cart < ApplicationRecord
    validates :total, presence: true
    has_many :line_items
    has_many :games, through: :line_items

    def cart_total
        self.line_items.sum do |item|
            item.price
        end
    end
end
