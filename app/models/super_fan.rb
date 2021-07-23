class SuperFan < ApplicationRecord
    has_many :reviews
    has_many :songs, through: :reviews
    belongs_to :song
end
