class Review < ApplicationRecord
    belongs_to :user
    belongs_to :future_proof, :optional => true
end
