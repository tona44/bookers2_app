class Book < ApplicationRecord
  
  belongs_to :user
    #メソッドの様な使い方が出来る　例：@book.user 
end
