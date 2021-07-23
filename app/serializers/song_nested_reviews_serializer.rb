class SongNestedReviewsSerializer < ActiveModel::Serializer
  attributes :id, :name, :youtube_link
  has_many :reviews
end
