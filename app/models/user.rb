class User < ApplicationRecord
    has_secure_password
    has_many :carts
    has_many :line_items, through: :carts
    validates :username, :password,  presence: true
    validates :username, uniqueness: true

end