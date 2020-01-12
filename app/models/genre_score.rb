class GenreScore < ApplicationRecord
    has_one :score
    has_one :genre
end