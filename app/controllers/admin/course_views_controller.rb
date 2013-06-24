# coding: utf-8
class Admin::CourseViewsController < Admin::Base
   before_filter :login_required

  def index

  end

  def show
    @course_view = CourseView.find(params[:id])
    @response = Response.new
  end

  def new
    @course_view = CourseView.new
  end

#  def create    
#    @course_view = CourseView.new(params[:course_view])
#    @course_view.member = @current_member
#    @course_info = CourseInfo.find_by_id(session[:course_info_id])
#    @course_view.title_of_course = @course_info.title
#    @course_view.id_course = @course_info.id
#    @course_view.course_info = @course_info
#    @course_view.id_member = @current_member.id
#    if @course_view.save
#      redirect_to @course_info, notice: "コメントを追加しました"
#    else
#      redirect_to @course_info, notice: "コメントに誤りがあります"
#    end
#  end

  def edit
    @course_view = CourseView.find(params[:id])
    @course_info = CourseInfo.find_by_id(@course_view.course_info_id)
  end

  def update
    @course_view = @current_member.course_views.find(params[:id])
    @course_info = @course_view.course_info
    @course_view.assign_attributes(params[:course_view])

    if @course_view.save
      redirect_to [:admin, @course_info], notice: "管理者がコメントを更新しました"
    else
      render "admin/course_views/edit"
    end
  end

  def destroy
    @course_view = CourseView.find(params[:id])
    @course_info = @course_view.course_info
    @course_view.destroy

    redirect_to [:admin, @course_info], notice: "管理者がコメントを削除しました"
  end

  def response_create
    @response = Response.new(params[:response])
    @response.member = @current_member
    @course_view = CourseView.find(params[:id])
    @response.course_view = @course_view
    @course_info = @course_view.course_info
    @member = Member.find(@course_view.member_id)
    redirect_to [:admin, @course_info], notice: "管理者はその操作はできません。"
  end

end
