class SubList < ApplicationRecord
    belongs_to :category
    has_many :tasks
end
