class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def remember_me
    true
  end
  
  has_many :restaurants, dependent: :destroy 
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_restaurants, through: :bookmarks, source: :restaurant
  has_many :comments, dependent: :destroy
  has_many :commented_restaurants, through: :comments, source: :restaurant
  validates :name, presence: true

  def already_bookmarked?(restaurant)
    self.bookmarks.exists?(restaurant_id: restaurant.id)
  end

end
