class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @book_comment = BookComment.new(book_comment_params)
    @book_comment.book_id = @book.id    # 1:Nの関係性を紐付け
    @book_comment.user_id = current_user.id    # 1:Nの関係性を紐付け

    if @book_comment.save
      redirect_to book_path(@book)
    else
      @user = @book.user
      render "books/show"
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    book_comment = @book.book_comments.find_by(id: params[:id])  #find_byはid以外の条件で探せる為、条件(今回はid)をparamsの前に記述
                                       #find(params[:id])でも可(@book.book_commentsで特定の本のコメント達を指定している為)
    book_comment.destroy
    redirect_to book_path(@book)

  end


  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
