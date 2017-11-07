module ApplicationHelper
  def render_markdown(text)
    CommonMarker.render_html(text, :DEFAULT).html_safe
  end
end
