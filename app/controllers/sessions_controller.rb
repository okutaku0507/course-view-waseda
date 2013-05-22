# coding: utf-8

class SessionsController < ApplicationController

 def create
    member = Member.authenticate(params[:email], params[:password])
    if member
      cookies.signed[:member_id] = { value: member.id, expires: 30.days.from_now }
    else
      flash.alert = "※メールアドレスとパスワードが一致しません"
    end
    redirect_to params[:from] || :account
  end

  def destroy
    cookies.delete(:member_id)
    redirect_to :root
  end
end
