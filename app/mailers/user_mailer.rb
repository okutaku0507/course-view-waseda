# coding: utf-8

class UserMailer < ActionMailer::Base
  default :from => "okutaku0507@yahoo.co.jp"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.mailer.subject
  #

  def welcome_email(member)
    @member = member
    mail(:to => member.email, :subject => "Waseda Course Viewからパスワードをお知らせします")
  end
  
end

