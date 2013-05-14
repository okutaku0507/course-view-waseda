class Admin::CourseInfosController < Admin::Base
  def index
    @course_infos = CourseInfo.order("id")
  end

  def show
    @course_info = CourseInfo.find(params[:id])
    @course_views = @course_info.course_views

    session[:course_info_id] = @course_info.id
  end

  def new
    @course_info = CourseInfo.new
  end

  def edit
    @course_info = CourseInfo.find(params[:id])
  end

  def create
    @course_info = CourseInfo.new(params[:course_info])
    if @course_info.save
      redirect_to [:admin, @course_info], notice: "講義を新規追加しました！"
    else
      render "new"
    end
  end

  def update
    @course_info = CourseInfo.find(params[:id])
    @course_info.assign_attributes(params[:course_info])
    if @course_info.save
      redirect_to [:admin, @course_info], notice: "管理者が講義情報を更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @course_info = CourseInfo.find(params[:id])
    @course_info.destroy
    redirect_to :admin_course_infos, notice: "管理者が講義を削除しました"
  end


  # like,bad機能

  def like
    @course_info = CourseInfo.find(params[:id])
    @current_member.like_voted_courses << @course_info
    redirect_to @course_info
  end

  def unlike
    @current_member.like_voted_courses.delete(CourseInfo.find(params[:id]))
    @course_info = CourseInfo.find(params[:id])
    redirect_to @course_info
  end

  def bad
    @course_info = CourseInfo.find(params[:id])
    @current_member.bad_voted_courses << @course_info
    redirect_to @course_info
  end

  def no_bad
    @current_member.bad_voted_courses.delete(CourseInfo.find(params[:id]))
    @course_info = CourseInfo.find(params[:id])
    redirect_to @course_info
  end
end
