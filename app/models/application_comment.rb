class ApplicationComment < ApplicationRecord
    belongs_to :user, :app
    
end
