# coding: utf-8
class AccountsController < ApplicationController
  before_filter :login_required

  def show
    @member = @current_member
    @course_views = @current_member.course_views
    @take_courses = @current_member.take_courses
  end

  def edit
    @member = @current_member
    @account = @member
  end

  # ユーザーの登録内容の更新
  def update
    @member = @current_member
    @account = @member

    @member.assign_attributes(params[:member])
    if @member.save
      redirect_to :account, notice: "パスワードを更新しました。"
    else
      render "edit"
    end
  end
  
  def destroy
    params[:email] = @current_member.email
    member = Member.authenticate(params[:email], params[:password])
    if member
      @member = @current_member
      @member.destroy
      redirect_to :course_infos, notice: "ユーザーアカウントを削除しました。今までご利用ありがとうございました。(´；ω；｀)"
    else
      redirect_to :back, notice: "パスワードが一致しません。"
    end
  end

  def take_course_update
  end

  def schedule
  end
  
  def comment
  end
  
  def setting
  end
  
  def withdrawal
  end
  
end
