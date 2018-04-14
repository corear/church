class UserMailer < ActionMailer::Base
  default :from => "ICC Hub <icchubapp@gmail.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
    @user = user

    mail(:to => "#{user.display_name} <#{user.email}>", :subject => "Welcome to the ICC Hub!")
  end
  
  def announcement(u,con,i)
    @con = con
    @id = i
      mail(:to => "#{u.display_name} <#{u.email}>", :subject => "Alert: New Announcement!")
  end
  
  def send_custom(user,from,subject,msg)
    @user = User.find(user)
    @msg = msg
    @nam = User.find_by_email(from).display_name
    @usernam = User.find_by_email(from).username
    mail(:to => "#{@user.display_name} <#{@user.email}>", :subject => "#{subject}", :reply_to => "#{from}", :from => "#{@nam} via the ICC Hub <icchubapp@gmail.com>")
  end
end
