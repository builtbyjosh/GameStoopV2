class User < ApplicationRecord
    has_secure_password
    has_many :carts
    has_many :line_items, through: :carts
    validates :username, :password,  presence: true
    validates :username, uniqueness: true
    # devise :omniauthable, omniauth_providers: %i[github]


    # def self.from_omniauth(auth)
    #     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    #       user.email = auth.info.email
    #       user.password = Devise.friendly_token[0, 20]
    #       user.username = auth.info.username
    #     end
    #   end
    # def self.new_with_session(params, session)
    #     super.tap do |user|
    #         if data = session["devise.github_data"] && session["devise.github_data"]["extra"]["raw_info"]
    #         user.email = data["email"] if user.email.blank?
    #         end
    #     end
    # end
end