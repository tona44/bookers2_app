class FavoritesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @book = Book.find(params[:book_id])
    favorite = @book.favorites.new(user_id: current_user.id)  #上記2行は favorite = current_user.favorites.new(book_id: book.id) に省略可
    favorite.save
  end

  def destroy
    @book = Book.find(params[:book_id])
    favorite = @book.favorites.find_by(user_id: current_user.id)  #上記2行は favorite = current_user.favorites.find_by(book_id: book.id)　に省略可
    favorite.destroy
  end
  
    # redirect_to request.referer は非同期通信の為削除する
    # render先は自動的に favorites/create(destroy).js.erb となる（コントローラー名/アクション名.js.erb）

  
  
end
