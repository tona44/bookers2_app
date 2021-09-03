class Book < ApplicationRecord
  
  belongs_to :user
    #メソッドの様な使い方が出来る　例：@book.user
  
  has_many :favorites, dependent: :destroy
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?   #Favoritesテーブルの[user_id]カラムに、既に[user.id]が存在するかどうか判定
  end
  
  
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
  
end
