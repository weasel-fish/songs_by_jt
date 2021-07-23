class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :super_fan_id, :song_id, :rating, :comment
end
