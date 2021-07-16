class Photo < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  has_one_attached :image

 

  with_options presence: true do
    validates :image
    validates :title
    validates :place
    validates :description
  end
end
