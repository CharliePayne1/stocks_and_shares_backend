class User < ApplicationRecord
    has_many :stocks
    has_many :sectors, through: :stocks

    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
end
