class Tag < ApplicationRecord
  validates :name, presence: true

  has_many :restaurant_tag_relations, dependent: :destroy
  has_many :restaurants, through: :restaurant_tag_relations, dependent: :destroy
end
