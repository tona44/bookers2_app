class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :books,dependent: :destroy
  
  attachment :profile_image  #プロフィール画像投稿をできるようにする
         
  validates :name, presence: true
         
end
