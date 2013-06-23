# coding: utf-8

class SessionsController < ApplicationController

  def new
  end
  
  def create
    member = Member.authenticate(params[:email], params[:password])
    if member
      cookies.signed[:member_id] = { value: member.id, expires: 30.years.from_now }
      redirect_to params[:from] || :account
    else
      flash.alert = "※メールアドレスとパスワードが一致しません"
          redirect_to params[:from] || :course_infos
    end
  end

  def destroy
    cookies.delete(:member_id)
    redirect_to :root
  end
end
