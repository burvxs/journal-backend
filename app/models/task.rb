class Task < ApplicationRecord
    belongs_to :user
    belongs_to :category, optional: true
    belongs_to :sub_list, optional: true
    belongs_to :future_proof, optional: true
end
