module ApplicationHelper
  def is_active_menu_item?(path)
    if current_page? path
      "active"
    else
      ""
    end
  end
end
