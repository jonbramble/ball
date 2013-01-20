class UserMailer < ActionMailer::Base
  default from: "no-reply@astburyball2013.info"

  def welcome
   mail(:to => "phyjpb@leeds.ac.uk", :subject => "Welcome to My Awesome Site")
  end
end
