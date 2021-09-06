class UsersController < ApplicationController
  
  def index
    @user = User.find(current_user.id)
    @users = User.all
    @book = Book.new
    
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
       redirect_to book_path(@book.id)
    else
       @books = Book.all
       @user = User.find(current_user.id)
       render 'books_path'
    end
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books   # 1:Nの関係。ユーザーに紐づくbooksモデルにある本全部
    @book_new = Book.new
  end
  
  def followings  #フォロー一覧
    user = User.find(params[:id])
    @users = user.followings
  end
  
  def followers  #フォロワー一覧
    user = User.find(params[:id])
    @users = user.followers
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      # 更新出来ない場合の処理（エラーメッセージを表示させるため）
      render :edit 
    end
  end


private

  def book_params
    params.require(:book).permit(:title,:body)
  end
  
  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end
  
end
