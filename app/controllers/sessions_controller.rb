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
      if request.smart_phone?
        flash[:notice] = "※メールアドレスとパスワードが一致しません"
        redirect_to params[:from] || :back
      else
        flash.alert = "※メールアドレスとパスワードが一致しません"
        redirect_to params[:from] || :back
      end

    end
  end

  def destroy
    cookies.delete(:member_id)
    redirect_to :root
  end
end
