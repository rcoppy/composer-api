class ScoreTag < ApplicationRecord
    has_one :score
    has_one :tag
end
