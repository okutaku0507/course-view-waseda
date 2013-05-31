class MembersController < ApplicationController


  def new
    @member = Member.new
  end

  def edit
    @member = Member.find(params[:id])
  end

  # ユーザーの新規登録
  def create
    @member = Member.new(params[:member])

    if @member.save
      UserMailer.welcome_email(@member).deliver
      redirect_to :course_infos,
        notice: "ユーザーの登録が完了しました。
                \n登録されたメールアドレスに仮パスワードをお送りします。"
    else
      redirect_to :course_infos,
        notice: "ユーザーの登録が完了しました。
                \n登録されたメールアドレスに仮パスワードをお送りします。"
    end
  end

  # ユーザーの登録内容の更新
  def update
    @member = Member.find(params[:id])
    @member.assign_attributes(params[:member])
    if @member.save
      redirect_to :account, notice: "パスワードを更新しました。"
    else
      render "edit"
    end
  end

  # ユーザーの削除
  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to :course_infos, notice: "ユーザーアカウントを削除しました。今までご利用ありがとうございました。(´；ω；｀)"
  end





end
