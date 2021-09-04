class BooksController < ApplicationController
  

  def create
  
    @book = Book.new(book_params)
    @book.user_id = current_user.id  #ログインユーザーのidを紐付ける(@book.user_idは1:Nの関係)
    if @book.save
       redirect_to book_path(@book), notice:"You have created book successfully."
    else
      # 投稿出来ない場合の処理（エラーメッセージを表示させるため）
       @books = Book.all
       @user = User.find(current_user.id)
       render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = User.find(current_user.id)
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user  # 1:Nの関係にあるもので記述可
    @book_new = Book.new  # @bookだと新規投稿フォームに既存投稿が反映されてしまう為
    @book_comment = BookComment.new
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
       render :edit
    else
       redirect_to books_path
    end

  end

  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id  #ログインユーザーのidを紐付ける(@book.user_idは1:Nの関係)
    if @book.update(book_params)
       redirect_to book_path(@book), notice:"You have updated book successfully."
    else
       render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end


private

  def book_params
    params.require(:book).permit(:title,:body)
  end
  

end
