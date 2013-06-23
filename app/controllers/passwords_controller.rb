# coding: utf-8
class PasswordsController < ApplicationController
  def forget
    render :forgot
  end
  
 def start_resetting
   @member = Member.new(params[:member])
   if @forgot_member = Member.find_by_email(@member.email)
     @forgot_member.before_create
     @forgot_member.password = @forgot_member.initial_password 
   if @member.email == @member.email_confirmation
     if @forgot_member.save
         UserMailer.forgot_password(@forgot_member).deliver
         redirect_to :send_mail_password
     else
       redirect_to :forgot_password, notice: "更新に失敗しました。"
      end
    else
      redirect_to :forgot_password, notice: "メールアドレスと確認が一致しません。"
    end
    else
      redirect_to :forgot_password, notice: "メールアドレスに誤りがあるか、登録されていません。"
   end
  end
  
  def send_mail
    render :send_mail
  end
  
  
end
