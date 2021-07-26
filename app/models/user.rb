class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 has_many :active_relationships, class_name: 'Follow', foreign_key: 'user_id'
 has_many :passive_relationships, class_name: 'Follow', foreign_key: 'target_user_id'
 has_many :followings, through: :active_relationships, source: :target_user
 has_many :followers, through: :passive_relationships, source: :user
 has_many :photos, dependent: :destroy
 has_many :likes, dependent: :destroy
 has_many :liked_photos, through: :likes, source: :photo

 def liked_by?(photo_id)
  likes.where(photo_id: photo_id).exists?
end

  

   with_options presence: true do
     validates :birthday
     validates :nickname
   end
      
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
   validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
  
end
