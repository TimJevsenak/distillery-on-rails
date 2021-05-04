class UserCommentsController < ApplicationController
    def create
        @comment = UserComment.new(comment_params)

        @user = User.find(@comment.receiver_id)
    
        if @comment.save
            CommentNotifierMailer.with(user: @user).notification_email.deliver_now
            redirect_to user_path(id: @comment.receiver_id)
        else
            redirect_to root_path
        end
      end
    
      def update
      end
    
      def delete
      end 
    
      private
        def comment_params
          params.require(:user_comment).permit(:user_id, :receiver_id, :body, :created_at, :updated_at, :blacklist)
        end
end
