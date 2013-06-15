#coding: utf-8
class CourseInfosController < ApplicationController
  def index
    if @current_member
      @course_infos = CourseInfo.order("id").
                 paginate(page: params[:page], per_page: 6)
      params[:faculty] =  @current_member.faculty
      @course_infos = @course_infos.search(params)
    else
      @course_infos = CourseInfo.order("id").
                 paginate(page: 1, per_page: 6)
    end
  end

  def show
    @course_info = CourseInfo.find(params[:id])
    @course_views = @course_info.course_views
    @average_teacher_rank = TeacherRank.where(course_info_id: @course_info.id).average(:teacher_rank)
    @course_view = CourseView.new
    @take_course = TakeCourse.new
    @teacher_rank = TeacherRank.new
    @take_course = TakeCourse.new
    @response = Response.new
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
    @course_info.teacher = @course_info.teacher.gsub("　", " ")
    @course_info.teacher = @course_info.teacher.gsub(" ", "")
    @course_info.text_for_search = @course_info.title + " " + @course_info.teacher
    if !CourseInfo.where(title: @course_info.title, teacher: @course_info.teacher, day_of_the_week: @course_info.day_of_the_week, open_time: @course_info.open_time, open_term: @course_info.open_term, open_faculty: @course_info.open_faculty).exists?
      if @course_info.save
        redirect_to @course_info, notice: "講義を新規追加しました！"
      else
        render "new"
      end
    else
      redirect_to :new_course_info, notice: "その講義はすでに存在しています"
    end
  end

  def update
    @course_info = CourseInfo.find(params[:id])
    @course_info.assign_attributes(params[:course_info])
    @course_info.text_for_search = @course_info.title + " " + @course_info.teacher
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
    params[:faculty] =  @current_member.faculty
    params[:course_and_teacher] = params[:course_and_teacher].gsub("　", " ")
    @course_infos = CourseInfo.search(params)
          .paginate(page: params[:page], per_page: 6)
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
    @course_info = CourseInfo.find(params[:id])
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
      link_to @course_info, notice: @course_info.teacher + "教授を評価しました！"
    else
      redirect_to @course_info, notice: "教授を評価に失敗しました..."
    end

  end

  def not_teacher_rank
    @current_member.ranked_teacher.delete(CourseInfo.find(params[:id]))
    @course_info = CourseInfo.find(params[:id])
    redirect_to @course_info
  end
  
  def view_create
    @course_view = CourseView.new(params[:course_view])
    @course_view.member = @current_member
    @course_info = CourseInfo.find(params[:id])
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
  
  def take_course_create
    @take_course = TakeCourse.new
    @course_info = CourseInfo.find(params[:id])
    @take_course.course_info = @course_info
    @take_course.member = @current_member
    @take_course.take_course_title = @course_info.title
    @take_course.take_course_open_week = @course_info.day_of_the_week
    @take_course.take_course_open_time = @course_info.open_time
    @take_course.id_of_take_course = @course_info.id
    @take_course.take_course_note = ""
    @take_course.take_course_late_point = 0
    @take_course.take_course_absent_point = 0
      if !@current_member.take_courses.where(take_course_open_time: @course_info.open_time, take_course_open_week: @course_info.day_of_the_week).exists?
          if @take_course.save
             redirect_to @course_info, notice: @take_course.take_course_title + "が時間割に追加されました。"
          else
             redirect_to @course_info, notice: @take_course.take_course_title + "を時間割に追加が失敗しました..."
          end
      elsif @take_course.take_course_open_time == 8 || @take_course.take_course_open_time == 9
          if @take_course.save
             redirect_to @course_info, notice: @take_course.take_course_title + "が時間割に追加されました。"
          else
             redirect_to @course_info, notice: @take_course.take_course_title + "を時間割に追加が失敗しました..."
          end
      else
        redirect_to @course_info, notice: "すでにこの時限・曜日の講義を履修しています"
      end
  end
  
  def teacher_rank_create
    @teacher_rank = TeacherRank.new(params[:teacher_rank])
    @teacher_rank.member = @current_member
    @course_info = CourseInfo.find(params[:id])
    @teacher_rank.course_info = @course_info
    if @teacher_rank.save
      redirect_to @course_info, notice:  @course_info.teacher + "教授を評価しました！"
    else
      redirect_to @course_info, notice: "教授評価に失敗しました..."
    end
  end
  
  
end
