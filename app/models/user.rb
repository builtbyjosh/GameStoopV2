class User < ApplicationRecord
    has_secure_password
    has_many :carts
    has_many :line_items, through: :carts
    validates :username, :email, :password, :password_confirmation, presence: true
    validates :email, :username, uniqueness: true
    devise :omniauthable, omniauth_providers: %i[github]

end