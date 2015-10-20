module ApplicationHelper

  def icon(icon)
    content_tag(:i, icon.to_s, class: "material-icons")
  end

end