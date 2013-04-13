class UserMailer < ActionMailer::Base
 
  helper ApplicationHelper
  helper MealsEmailHelper

  default from: "no-reply@astburyball2013.info"

  def welcome_email(user,password)
    @user = user
    @password = password
    @url = 'http://www.astburyball2013.info/users/sign_in'
    mail(:to => user.email, :subject => "Astbury May Ball 2013")
  end

  def update_meal(user)
    @user = user
    mail(:to => user.email, :subject => "Astbury May Ball - Meal Choices Updated")
  end

  #def mass_mail(user, subject)
    #@user = user
    #mail(:to => user.email, :subject => subject )
  #end

end
