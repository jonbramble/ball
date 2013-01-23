class UserMailer < ActionMailer::Base
  default from: "no-reply@astburyball2013.info"

  def welcome_email(user,password)
    @user = user
    @password = password
    @url = 'http://www.astburyball2013.info/users/sign_in'
    mail(:to => user.email, :subject => "Welcome Test Mail")
  end
end
