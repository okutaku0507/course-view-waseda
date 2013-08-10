#coding: utf-8
class CirclesController < ApplicationController
  def index
    @circles = Circle.order("id")
                     .paginate(page: params[:page], per_page: 20)
  end
  
  def search
    if params[:circle_keywords].present?
      params[:circle_keywords] = params[:circle_keywords].gsub("　", " ")
    end
    @circles = Circle.search(params)
          .paginate(page: params[:page], per_page: 20)
    render "index"
  end
  
  def show
    @circle = Circle.find(params[:id])
    circle_type
    circle_belong
    circle_open
    if params[:format].in?(["jpg", "png", "gif"])
      send_image
    else
      render "circles/show"
    end
  end
  
  def new
    @circle = Circle.new
    @circle.build_image
  end
  
  def create
    @circle = Circle.new(params[:circle])
    @circle_creater = CircleCreater.new
    @circle_creater.member_id = @current_member.id
      if @circle.save
        @circle_creater.circle_id = @circle.id
        @circle_creater.save
        redirect_to @circle, notice: "あなたのサークルページを作成しました！"
      else
        render "new"
      end
  end
  
  def edit
    @circle = Circle.find(params[:id])
    circle = Circle.authenticate(params[:id], params[:password])
    if circle
      render "edit"
      @circle.build_image unless @circle.image
    else
      redirect_to @circle, notice: "パスワードが一致しません。"
    end
  end
  
  def update
    @circle = Circle.find(params[:id])
    @circle.assign_attributes(params[:circle])
    if @circle.save
      redirect_to @circle, notice: "サークル情報を更新しました。"
    else
      render "edit"
    end
  end
  
  def destroy
    @circle = Circle.find(params[:id])
    @circle.destroy
    redirect_to :circles, notice: "サークルを削除しました。"
  end

  private
  
  def circle_type
    if @circle.circle_type == "all_waseda"
      @circle.circle_type = "オール早稲田"
    else
      @circle.circle_type = "インカレ"
    end
  end
  
  def circle_belong
    if @circle.belong == "center"
      @circle.belong = "本キャン"
    elsif @circle.belong == "science"
      @circle.belong = "理工"
    elsif @circle.belong == "sport"
      @circle.belong = "所沢"
    else
      @circle.belong = "文キャン"
    end
  end
  
  def circle_open
    if @circle.open == "yes"
      @circle.open = "募集中"
    else
      @circle.open = "現在募集はしていません。"
    end
  end
  
  # 画像送信
  def send_image
    if @circle.image.present?
      send_data @circle.image.data,
        type: @circle.image.content_type, disposition: "inline"
    else
      raise NotFound
    end
  end
  
end
