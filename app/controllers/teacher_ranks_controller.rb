class TeacherRanksController < ApplicationController
  def new
    @teacher_rank = TeacherRank.new
  end

#  def create
#    @teacher_rank = TeacherRank.new(params[:teacher_rank])
#    @teacher_rank.member = @current_member
#    @course_info = CourseInfo.find_by_id(session[:course_info_id])
#    @teacher_rank.course_info = @course_info
#    if @teacher_rank.save
#      redirect_to @course_info, notice: "教授を評価しました！"
#    else
#      redirect_to @course_info, notice: "教授評価に失敗しました..."
#    end
#  end

end
