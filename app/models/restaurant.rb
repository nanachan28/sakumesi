class Restaurant < ApplicationRecord
    geocoded_by :address
    after_validation :geocode, if: :address_changed?
    mount_uploader :image, ImageUploader
    belongs_to :user
    def self.ransackable_attributes(auth_object = nil)
        ["about", "genre", "name"]
    end
    def self.ransackable_associations(auth_object = nil)
        ["user"]
    end

    validates :name, presence: true
    validates :addresscode, presence: true
    validates :address, presence: true
    validates :opentime, presence: true
    validates :endtime, presence: true

    has_many :restaurant_tag_relations, dependent: :destroy
    has_many :tags, through: :restaurant_tag_relations, dependent: :destroy
    has_many :bookmarks, dependent: :destroy
    has_many :bookmarked_users, through: :bookmarks, source: :user
    has_many :comments, dependent: :destroy
    has_many :commented_users, through: :comments, source: :user
    ransack_alias :tag, :tags_name
    has_many_attached :menufile

end
