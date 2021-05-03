class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)


    if @comment.save
      redirect_to brewery_path(id: @comment.brewery_id)
    else
      render :new
    end
  end

  def update
  end

  def delete
  end 

  private
    def comment_params
      params.require(:comment).permit(:user_id, :brewery_id, :text, :rating, :created_at, :updated_at, :blacklist)
    end
end
