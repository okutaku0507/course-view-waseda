class Admin::CourseInfosController < Admin::Base
  def index
      @course_infos = CourseInfo.order("id").
                 paginate(page: params[:page], per_page: 6)
      @course_infos = @course_infos.search(params)
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
    if !CourseInfo.where(title: @course_info.title, teacher: @course_info.teacher, day_of_the_week: @course_info.day_of_the_week, open_time: @course_info.open_time, open_term: @course_info.open_term, open_faculty: @course_info.open_faculty).exists?
      if @course_info.save
        redirect_to [:admin, @course_info], notice: "管理者が講義を新規追加しました！"
      else
        render "admin/course_infos/new"
      end
    else
      redirect_to :new_admin_course_info, notice: "その講義はすでに存在しています"
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

  def search
    params[:faculty] =  @current_member.faculty
    @course_infos = CourseInfo.search(params)
          .paginate(page: params[:page], per_page: 6)
    render "index"
  end

  # like,bad機能

  def like
    @course_info = CourseInfo.find(params[:id])
    redirect_to [:admin, @course_info], notice:  "管理者はその操作はできません。"
  end

  def unlike
    @course_info = CourseInfo.find(params[:id])
    redirect_to [:admin, @course_info], notice:  "管理者はその操作はできません。"
  end

    
  def not_take
    @course_info = CourseInfo.find(params[:id])
    redirect_to [:admin, @course_info], notice:  "管理者はその操作はできません。"
  end
  

  def not_teacher_rank
    @course_info = CourseInfo.find(params[:id])
    redirect_to [:admin, @course_info], notice:  "管理者はその操作はできません。"
  end
  
  def view_create
    @course_view = CourseView.new(params[:course_view])
    @course_view.member = @current_member
    @course_info = CourseInfo.find(params[:id])
    @course_view.title_of_course = @course_info.title
    @course_view.id_course = @course_info.id
    @course_view.course_info = @course_info
    @course_view.id_member = @current_member.id
      redirect_to [:admin, @course_info], notice:  "管理者はその操作はできません。"
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
      redirect_to [:admin, @course_info], notice:  "管理者はその操作はできません。"
  end
  
  def teacher_rank_create
    @teacher_rank = TeacherRank.new(params[:teacher_rank])
    @teacher_rank.member = @current_member
    @course_info = CourseInfo.find(params[:id])
    @teacher_rank.course_info = @course_info
      redirect_to [:admin, @course_info], notice:  "管理者はその操作はできません。"
  end
  
  
end
