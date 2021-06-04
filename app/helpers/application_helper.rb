module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    if column != sort_column
      css_class = nil
    elsif sort_direction == "asc"
      css_class = "fa fa-chevron-up"
    else
      css_class = "fa fa-chevron-down"
    end
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to "#{title} <span class='#{css_class}'></span>".html_safe, {:sort => column, :direction => direction}
  end
end
