class User < ApplicationRecord
    has_secure_password
    has_many :carts
    has_many :line_items, through: :carts
    validates :email, :password, :password_confirmation, presence: true
    validates :email, :username, uniqueness: true


end