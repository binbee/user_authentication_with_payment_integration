class MailToUser < ActionMailer::Base
  default from: "rorshop@inc.in"
  def welcome_mail(user)
  mail(:to=>user.email,:subject=>"Congratulations,You Succesfully registered to our Portal !")
  end
end
