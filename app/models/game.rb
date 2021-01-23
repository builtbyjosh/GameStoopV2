class Game < ApplicationRecord
    has_many :line_items
    has_many :carts, through: :line_items
    scope :fps, -> { where(genre: "fps") }
    scope :strategy, -> { where(genre: "strategy") }
    scope :simulation, -> { where(genre: "simulation") }
    scope :platformer, -> { where(genre: "platformer") }

    
end
