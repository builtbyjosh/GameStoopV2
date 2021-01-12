class Cart < ApplicationRecord
    has_many :line_items
    has_many :games, through: :line_items
end
