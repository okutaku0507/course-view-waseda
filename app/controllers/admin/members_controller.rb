class Admin::MembersController < Admin::Base

  def index
    @members = Member.order("id")
  end

  # 検索
  def search
    @members = Member.search(params[:q])
    render "index"
  end
  
  def show
    @member = Member.find(params[:id])
    @course_views = @member.course_views
    @take_courses = @member.take_courses
  end

  def new
  end

  def edit
    @member = Member.find(params[:id])
  end

  # ユーザーの新規登録
  def create
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
    redirect_to :admin_course_infos, notice: "管理者が削除しました。"
  end





end
