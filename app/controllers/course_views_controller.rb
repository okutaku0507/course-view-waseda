#coding: utf-8

class CourseViewsController < ApplicationController
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

  def edit
    @course_view = CourseView.find(params[:id])
    @course_info = CourseInfo.find_by_id(@course_view.course_info_id)
    if @current_member.id == @course_view.member_id
      redirect_to @course_view
    else
      raise Forbidden
    end
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

  def response_create
    @response = Response.new(params[:response])
    @response.member = @current_member
    @course_view = CourseView.find(params[:id])
    @response.course_view = @course_view
    @course_info = @course_view.course_info
    @member = Member.find(@course_view.member_id)
    if @response.save
      unless @response.member_id == @course_view.member_id
        UserMailer.response_email(@response).deliver
        redirect_to @course_view, notice: "コメントを追加しました"
      else
        redirect_to @course_view, notice: "コメントを追加しました"
      end
    else
      redirect_to @course_view, notice: "コメントに誤りがあります"
    end
  end

end
