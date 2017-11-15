module ApplicationHelper
  def render_markdown(text)
    CommonMarker.render_html(text, :DEFAULT).html_safe
  end

  def nav_class(path)
    path == controller_name ? "active" : ""
  end
end
