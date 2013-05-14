module ApplicationHelper
  def page_title
    title = "Course View"
    title = @page_title + " - " + title if @page_title
    title
  end

  def menu_link_to(text, path)
    link_to_unless_current(text, path) { content_tag(:span, text) }
  end


# 改行文字 => BR
  def hbr(target)
    target = html_escape(target)
    target.gsub(/\r\n|\r|\n/, "<br />").html_safe
  end

end
