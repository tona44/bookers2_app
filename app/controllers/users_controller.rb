class UsersController < ApplicationController
  
  def index
    @user = User.find(current_user.id)
    @users = User.all
    @book = Book.new
  end
  
  def create
    book = Book.new(book_params)
    book.save
    redirect_to book_path(book.id)
  end

  def show
    @user = User.find(params[:id])
    @books = Book.all
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    user = User.find(params[:id])
    user.update
    redirect_to user_path(user)
  end


private

  def book_params
    params.require(:book).permit(:title,:body)
  end

end
