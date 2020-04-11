module ApplicationHelper
  def degrees(units)
    "<span>&#176 #{units}</span>".html_safe
  end
end
