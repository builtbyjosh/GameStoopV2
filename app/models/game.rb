class Game < ApplicationRecord
    has_many :line_items
    has_many :carts, through: :line_items
    scope :fps, -> {where(genre: "fps")}
end
