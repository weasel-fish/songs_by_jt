class Review < ApplicationRecord
    belongs_to :song
    belongs_to :super_fan
end
