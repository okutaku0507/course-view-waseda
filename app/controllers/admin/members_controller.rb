class Admin::MembersController < Admin::Base


  # 管理者だけが見れる会員一覧
  def index
    @members = Member.order("id")
  end

  # 検索
  def search
    @members = Member.search(params[:q])
    render "index"
  end

  # ユーザーの詳細
  def show
    @member = Member.find(params[:id])
  end

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
      redirect_to :admin_members,
        notice: "管理者によりユーザーの登録が完了しました。"
    else
      render "new"
    end
  end

  # ユーザーの登録内容の更新
  def update
    @member = Member.find(params[:id])
    @member.assign_attributes(params[:member])
    if @member.save
      redirect_to [:admin, @member], notice: "管理者がパスワードを更新しました。"
    else
      render "edit"
    end
  end

  # ユーザーの削除
  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to :admin_members, notice: "管理者がユーザーアカウントを削除しました。"
  end

  private




end
