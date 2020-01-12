class Rating < ApplicationRecord
    belongs_to :user, :app
end
