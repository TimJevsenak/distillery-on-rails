class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.text.nil? || @comment.rating.nil?
        format.html { redirect_to brewery_path(id: @comment.brewery_id), alert: 'Rating or text can not be empty!' }
    else

    if @comment.save
      redirect_to brewery_path(id: @comment.brewery_id)
    else
      render :new
    end
  end
  end
  end

  def update
  end

  def delete
  end 

  private
    def comment_params
      params.require(:comment).permit(:user_id, :brewery_id, :text, :rating)
    end
end
