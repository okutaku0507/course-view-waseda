# coding: utf-8
class MembersController < ApplicationController
  
  def new
    @member = Member.new
  end

  def edit
    if @current_member.try(:administrator?)
    @member = Member.find(params[:id])
    else
      raise Forbidden
    end
  end

  # ユーザーの新規登録
  def create
    @member = Member.new(params[:member])
    @member.full_name = @member.family_name + @member.first_name
    @member.university = 1 # 大学番号1は早稲田大学を指す
    check_subject
    if check_subject && @member.save
      UserMailer.welcome_email(@member).deliver
      flash.alert = nil
      redirect_to :course_infos,
        notice: "ユーザーの登録が完了しました。登録されたメールアドレスに仮パスワードをお送りします。"
    else
      render "new"
    end
  end

  # ユーザーの登録内容の更新
  def update
    @member = Member.find(params[:id])
    @member.assign_attributes(params[:member])
    if @member.save
      redirect_to :account, notice: "パスワードを更新しました。"
    else
      render "edit"
    end
  end

  # ユーザーの削除
  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to :course_infos, notice: "ユーザーアカウントを削除しました。今までご利用ありがとうございました。(´；ω；｀)"
  end

  private
  def check_subject
    if  @member.faculty == "政治経済学部"
      unless @member.subject == "政治学科" || @member.subject == "経済学科" || @member.subject == "国際政治経済学科"
        flash.alert = "学部と学科が一致しません。"
        return false
      else
        flash.alert = nil
        return true
      end
    end
    
    if  @member.faculty == "法学部"
      unless @member.subject == "無し"
        flash.alert = "法学部の方は'無し'を選択してください。"
        return false
      else
        flash.alert = nil
        return true
      end
    end

    if  @member.faculty == "第一文学部"
      unless @member.subject == "無し"
        flash.alert = "第一文学部の方は'無し'を選択してください。"
        return false
      else
        flash.alert = nil
        return true
      end
    end
    
    if  @member.faculty == "第一文学部"
      unless @member.subject == "無し"
        flash.alert = "第一文学部の方は'無し'を選択してください。"
        return false
      else
        flash.alert = nil
        return true
      end
    end
    
    if  @member.faculty == "第二文学部"
      unless @member.subject == "無し"
        flash.alert = "第二文学部の方は'無し'を選択してください。"
        return false
      else
        flash.alert = nil
        return true
      end
    end
    
    if  @member.faculty == "文化構想学部"
      unless @member.subject == "無し"
        flash.alert = "文化構想学部の方は'無し'を選択してください。"
        return false
      else
        flash.alert = nil
        return true
      end
    end
    
    if  @member.faculty == "文学部"
      unless @member.subject == "無し"
        flash.alert = "文学部の方は'無し'を選択してください。"
        eturn false
      else
        flash.alert = nil
        return true
      end
    end
    
    if  @member.faculty == "教育学部"
      unless @member.subject == "教育学専修" || @member.subject == "生涯教育学専修" || @member.subject == "教育心理学専修" || @member.subject == "初等教育学専攻" || @member.subject == "国語国文学科" || @member.subject == "英語英文学科" || @member.subject == "地理歴史専修" ||  @member.subject == "社会科学専修" || @member.subject == "生物学専修" || @member.subject == "地球科学専修" || @member.subject == "数学科" || @member.subject == "複合文化学科"
        flash.alert =  "学部と学科が一致しません。"
        return false
      else
        flash.alert = nil
        return true
      end
    end
    
    if  @member.faculty == "商学部"
      unless @member.subject == "無し"
        flash.alert = "商学部の方は'無し'を選択してください。"
        return false
      else
        flash.alert = nil
        return true
      end
    end
    
    if  @member.faculty == "基幹理工学部"
      unless @member.subject == "無し" || @member.subject == "数学科" || @member.subject == "応用数理学科" || @member.subject == "情報理工学科" || @member.subject == "機械科学・航空学科" || @member.subject == "電子光システム学科" || @member.subject == "表現工学科"
        flash.alert = "学部と学科が一致しません。また、一年生は'無し'を選択してください。"
        return false
      else
        flash.alert = nil
        return true
      end
    end
    
    if  @member.faculty == "創造理工学部"
      unless @member.subject == "建築学科" || @member.subject == "総合機械工学科" || @member.subject == "経営システム工学科" || @member.subject == "社会環境工学科" || @member.subject == "環境資源工学科"
        flash.alert = "学部と学科が一致しません。"
        return false
      else
        flash.alert = nil
        return true
      end
    end
    
    if  @member.faculty == "先進理工学部"
      unless @member.subject == "物理学科" || @member.subject == "応用物理学科" || @member.subject == "化学・生命化学" || @member.subject == "応用化学科" || @member.subject == "生命医科学科" || @member.subject == "電気・情報生命工学科"
        flash.alert = "学部と学科が一致しません。"
        return false
      else
        flash.alert = nil
        return true
      end
    end

    if  @member.faculty == "人間科学部"
      unless @member.subject == "人間環境科学科" || @member.subject == "健康福祉科学科" || @member.subject == "人間情報科学科"
        flash.alert = "学部と学科が一致しません。"
        return false
      else
        flash.alert = nil
        return true
      end
    end
    
    if  @member.faculty == "スポーツ科学部"
      unless @member.subject == "無し"
        flash.alert = "スポーツ科学部の方は'無し'を選択してください。"
        return false
      else
        flash.alert = nil
        return true
      end
    end
    
     if  @member.faculty == "国際教養学部"
      unless @member.subject == "無し"
        flash.alert = "国際教養学部の方は'無し'を選択してください。"
        return false
      else
        flash.alert = nil
        return true
      end
    end
    
    if  @member.faculty == "その他"
      unless @member.subject == "その他"
        flash.alert = "その他を選んだ方は'その他'を選択してください。"
        return false
      else
        flash.alert = nil
        return true
      end
    end
  end
  
end
