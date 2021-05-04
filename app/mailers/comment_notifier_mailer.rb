class CommentNotifierMailer < ApplicationMailer
    default from: 'notifications@breweryonrails.com'

  def notification_email
    @user = params[:user]
    @url  = 'https://brewery-on-rails.herokuapp.com/user/' + @user.id.to_s
    mail(to: @user.email, subject: 'New comment on your account!')
  end
end
