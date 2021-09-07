class SearchesController < ApplicationController

  def search
    @model = params["search"]["model"]
    @method = params["search"]["method"]
    @content = params["search"]["content"]
    @records = search_for(@model, @method, @content)
  end


private

  def search_for(model, method, content)

    if model == 'user'
      if method == 'perfect_match'    #完全一致
        User.where(name: content)
      elsif method == 'forward_match'     #前方一致
        User.where("name LIKE ?", content+'%' )
      elsif method == 'backward_match'    #後方一致
        User.where("name LIKE ?", '%'+content )
      elsif method == 'partial_match'     #部分一致
        User.where("name LIKE ?", '%'+content+'%' )
      end

    else # model == 'book'
      if method == 'perfect_match'    #完全一致
        Book.where(title: content)
      elsif method == 'forward_match'     #前方一致
        Book.where("title LIKE ?", content+'%' )
      elsif method == 'backward_match'    #後方一致
        Book.where("title LIKE ?", '%'+content )
      elsif method == 'partial_match'     #部分一致
        Book.where("title LIKE ?", '%'+content+'%' )
      end
    end

  end


end
