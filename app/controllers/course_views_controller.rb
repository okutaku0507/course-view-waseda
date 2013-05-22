class CourseViewsController < ApplicationController
   before_filter :login_required

  def index

  end

  def show
  end

  def new
    @course_view = CourseView.new
    @course_info = CourseInfo.find_by_id(session[:course_info_id])
  end

  def create
    
    @course_view = CourseView.new(params[:course_view])
    @course_view.member = @current_member
    @course_info = CourseInfo.find_by_id(session[:course_info_id])
    @course_view.title_of_course = @course_info.title
    @course_view.id_course = @course_info.id
    @course_view.course_info = @course_info
    @course_view.id_member = @current_member.id
    if @course_view.save
      redirect_to @course_info, notice: "コメントを追加しました"
    else
      redirect_to @course_info, notice: "コメントに誤りがあります"
    end
  end

  def edit
    @course_view = CourseView.find(params[:id])
    @course_info = CourseInfo.find_by_id(@course_view.course_info_id)
  end

  def update
    @course_view = @current_member.course_views.find(params[:id])
    @course_info = @course_view.course_info
    @course_view.assign_attributes(params[:course_view])

    if @course_view.save
      redirect_to @course_info, notice: "コメントを更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @course_view = CourseView.find(params[:id])
    @course_info = @course_view.course_info
    @course_view.destroy

    redirect_to @course_info, notice: "コメントを削除しました"
  end

end
