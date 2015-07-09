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
    mail(:to => member.email, :subject => "Course Viewからパスワードをお知らせします")
  end

  def response_email(response)
    @response = response
    @course_view = @response.course_view
    @responsed_member = @course_view.member
    @course_info = @course_view.course_info
    mail(:to => @responsed_member.email, :subject => "あなたの記事にコメントがつきました。")
  end

  def forgot_password(member)
    @member = member
    mail(:to => member.email, :subject => "Course Viewよりパスワードの再送をお知らせします")
  end
end
