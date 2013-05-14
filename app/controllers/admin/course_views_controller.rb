class Admin::CourseViewsController < Admin::Base
   before_filter :login_required

  def index

  end

  def show
    @course_view = CourseView.find(params[:id])
    @course_info = CourseInfo.find_by_id(@course_view.id_course)
    redirect_to [:admin, @course_info]
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
    @course_view.course_info = @course_info
    if @course_view.save
      redirect_to [:admin, @course_info], notice: "Viewを追加しました"
    else
      render "new"
    end
  end

  def edit
    @course_view = CourseView.find(params[:id])
  end

  def update
    @course_view = CourseView.find(params[:id])
    @course_info = @course_view.course_info
    @course_view.assign_attributes(params[:course_view])

    if @course_view.save
      redirect_to [:admin, @course_info], notice: "Viewを更新しました"
    else
      render "edit"
    end
  end

  def destroy
  
    @course_view = CourseView.find(params[:id])
    @course_info = @course_view.course_info
    @course_view.destroy

    redirect_to [:admin, @course_info], notice: "Viewを削除しました"
  end



end
