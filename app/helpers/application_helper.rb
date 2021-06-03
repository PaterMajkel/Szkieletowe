module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    if column != sort_column
      css_class = nil
    elsif sort_direction == "asc"
      css_class = "glyphicon glyphicon-triangle-top"
    else
      css_class = "glyphicon glyphicon-triangle-bottom"
    end
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to "#{title} <span class='#{css_class}'></span>".html_safe, {:sort => column, :direction => direction}
  end
end
