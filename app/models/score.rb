class Score < ApplicationRecord
    has_and_belongs_to_many :genres
    has_and_belongs_to_many :tags
end
