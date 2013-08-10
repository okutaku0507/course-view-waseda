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
  
  def translate_field_name(form, field)
    t(field, scope: [ :activerecord, :attributes, form.object.class.to_s.underscore ])
  end
  
  def format_error_message(model, field, form) 
    messages = model.errors[field]
    messages = [ messages ].flatten
    text = raw('')
    messages.each do |message|
      text << content_tag(:p,
        translate_field_name(form, field) + ' ' + message,
        class: "error_message")
    end
    text
  end
  
  def circle_image_tag(circle, options = {})
    if circle.image.present?
      path = circle_path(circle, format: circle.image.extension)
      link_to(image_tag(path, { alt: circle.title }.merge(options)), path)
    else
      ""
    end
  end
  
end
