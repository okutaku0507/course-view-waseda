class ResponsesController < ApplicationController  
  
  def new
    @response = Response.new
  end
  
  def create
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
    @response = Response.find(params[:id])
    @response.destroy
    @course_view = @response.course_view
    redirect_to @course_view, notice: "コメントを削除しました"
  end
end
