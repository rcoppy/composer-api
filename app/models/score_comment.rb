class ScoreComment < ApplicationRecord
    belongs_to :user
    belongs_to :score
end
