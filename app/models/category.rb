class Category < ApplicationRecord
    has_many :tasks
    has_many :sub_list
    belongs_to :user
end
