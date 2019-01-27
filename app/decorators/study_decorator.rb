module StudyDecorator
  def formatted_time
    "%d:%02d" % [hour, minute]
  end

  def first_line_of_content
    converted_content = CommonMarker.render_html(content, :DEFAULT)
    truncate(strip_tags(converted_content))
  end
end
