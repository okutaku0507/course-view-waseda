class CourseInfosController < ApplicationController
  def index
    if @current_member
      @course_infos = CourseInfo.order("id").
                 paginate(page: params[:page], per_page: 6)
    else
      @course_infos = CourseInfo.order("id").
                 paginate(page: 1, per_page: 6)
    end
  end

  def show
    @course_info = CourseInfo.find(params[:id])
    @course_views = @course_info.course_views
    @average_teacher_rank = TeacherRank.where(course_info_id: @course_info.id).average(:teacher_rank)
    session[:course_info_id] = @course_info.id
    @course_view = CourseView.new
    @take_course = TakeCourse.new
    @course_info = CourseInfo.find_by_id(session[:course_info_id])
    @teacher_rank = TeacherRank.new
    @take_course = TakeCourse.new
  end

  def new
    if @current_member
      @course_info = CourseInfo.new
    else
      redirect_to :course_infos
    end
  end

  def edit
    @course_info = CourseInfo.find(params[:id])
  end

  def create
    @course_info = CourseInfo.new(params[:course_info])
    if @course_info.save
      redirect_to @course_info, notice: "講義を新規追加しました！"
    else
      render "new"
    end
  end

  def update
    @course_info = CourseInfo.find(params[:id])
    @course_info.assign_attributes(params[:course_info])
    if @course_info.save
      redirect_to @course_info, notice: "講義情報を更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @course_info = CourseInfo.find(params[:id])
    @course_info.destroy
    redirect_to :course_infos, notice: "講義を削除しました"
  end

  def search
    @course_infos = CourseInfo.search(params[:q])
          .paginate(page: params[:page], per_page: 9)
    render "index"

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

  def take
    @take_course = TakeCourse.new
    @course_info = CourseInfo.find_by_id(session[:course_info_id])
    @take_course.member = @current_member
    @take_course.take_course_title = @course_info.title
    @take_course.take_course_open_week = @course_info.day_of_the_week
    @take_course.take_course_open_time = @course_info.open_time
    @take_course.id_of_take_course = @course_info.id
    @take_course.take_course_note = "特筆はありません"
    @take_course.take_course_late_point = 0
    @take_course.take_course_absent_point = 0
      if !@current_member.take_courses.where(take_course_open_time: @course_info.open_time, take_course_open_week: @course_info.day_of_the_week).exists? 
          @current_member.taked_courses << @course_info
          redirect_to @course_info
      else
        redirect_to @course_info, notice: "すでにこの時限・曜日の講義を履修しています"
      end
  end
    
  def not_take
    @current_member.taked_courses.delete(CourseInfo.find(params[:id]))
    @course_info = CourseInfo.find(params[:id])
    redirect_to @course_info
  end
  
  def teacher_rank
    @course_info = CourseInfo.find(params[:id])
    @teacher_rank = TeacherRank.new(params[:course_info])
    @teacer_rank.course_info_id = @course_info.id
    @take_course.member = @current_member
    @take_course.course_info = @course_info
    @take_course.take_course_title = @course_info.title
    
    if @current_member.techer_ranks << @take_course
      link_to @course_info, notice: "教授を評価しました！"
    else
      redirect_to @course_info, notice: "教授を評価に失敗しました..."
    end

  end

  def not_teacher_rank
    @current_member.ranked_teacher.delete(CourseInfo.find(params[:id]))
    @course_info = CourseInfo.find(params[:id])
    redirect_to @course_info
  end
  
end
