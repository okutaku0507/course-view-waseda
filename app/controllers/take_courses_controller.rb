class TakeCoursesController < ApplicationController

#  def create
#    @take_course = TakeCourse.new
#    @course_info = CourseInfo.find_by_id(session[:course_info_id])
#    @take_course.course_info = @course_info
#    @take_course.member = @current_member
#    @take_course.take_course_title = @course_info.title
#    @take_course.take_course_open_week = @course_info.day_of_the_week
#    @take_course.take_course_open_time = @course_info.open_time
#    @take_course.id_of_take_course = @course_info.id
#    @take_course.take_course_note = ""
#    @take_course.take_course_late_point = 0
#    @take_course.take_course_absent_point = 0
#      if !@current_member.take_courses.where(take_course_open_time: @course_info.open_time, take_course_open_week: @course_info.day_of_the_week).exists? && @take_course.save
#          redirect_to @course_info, notice: @take_course.take_course_title + "が時間割に追加されました。"
#      else
#        redirect_to @course_info, notice: "すでにこの時限・曜日の講義を履修しています"
#      end
# end
  
  def update
    @take_course = @current_member.take_courses.find(params[:id])
    @course_info = @take_course.course_info
    @take_course.assign_attributes(params[:take_course])
    @take_course.course_info = @course_info
    @take_course.take_course_title = @course_info.title
    @take_course.take_course_open_week = @course_info.day_of_the_week
    @take_course.take_course_open_time = @course_info.open_time
    @take_course.id_of_take_course = @course_info.id
    if @take_course.save
      redirect_to :account, notice: "更新できました！"
    else
      redirect_to :account, notice: "更新できません"
    end
  end

end
