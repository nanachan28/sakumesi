class Bookmark < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  validates_uniqueness_of :restaurant_id, scope: :user_id
end
