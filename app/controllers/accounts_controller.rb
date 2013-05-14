# codinc: utf-8
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


end
