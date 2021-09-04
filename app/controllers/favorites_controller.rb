class FavoritesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    book = Book.find(params[:book_id])
    favorite = book.favorites.new(user_id: current_user.id)
     # favorite = current_user.favorites.new(book_id: book.id) に省略可
    
    favorite.save
    redirect_to request.referer  #元画面に遷移
  end


  def destroy
    book = Book.find(params[:book_id])
    favorite = book.favorites.find_by(user_id: current_user.id)
     # favorite = current_user.favorites.find_by(book_id: book.id)　に省略可
    
    favorite.destroy
    redirect_to request.referer  #元画面に遷移
  end
  
end
