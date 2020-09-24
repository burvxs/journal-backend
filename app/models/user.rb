class User < ApplicationRecord
    has_many :future_proofers
    has_many :trackers
    has_many :reviews
    has_many :tasks
    has_many :categories
    #For bcrypt
    has_secure_password
end
