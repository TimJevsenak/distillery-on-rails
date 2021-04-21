desc "Sends mail notification to users each day to inform of pending overtime requests"
task send_emails: :environment do
  User.all.each do |user|
    UserMailer.with(user: user).send_emails
  end
end