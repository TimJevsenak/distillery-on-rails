class UsersController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])

    @comments = UserComment.select('user_comments.*').where('user_comments.receiver_id = :search', search: @user.id)
    @comments_number = Comment.where(:user_id => @user.id).count
    @comments_profiles_number = UserComment.where(:user_id => @user.id).count
    @comment = UserComment.new

    respond_to do |format|
      format.html
      format.pdf do
        pdf = UserReviewsPdf.new(@comments)
        send_data pdf.render 
      end
    end
  end
end
