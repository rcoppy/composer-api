class App < ApplicationRecord
    belongs_to :user
    belongs_to :score
    has_one :decision
end
