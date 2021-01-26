class User < ApplicationRecord
    has_secure_password
    has_many :carts
    has_many :line_items, through: :carts
    validates :username, :password, :email,  presence: true
    validates :username, :email,  uniqueness: true

end