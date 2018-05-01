module ApplicationHelper
  def current_page_is_all_entries?
    controller_name == "entries" && action_name == "index" &&
      params[:category_id].blank? && params[:starred].to_i.zero?
  end

  def current_page_is_starred?
    controller_name == "entries" && action_name == "index" && params[:starred].to_i == 1
  end

  def current_page_is_category?(category)
    controller_name == "entries" && action_name == "index" && category.id == params[:category_id]
  end

  def number_of_unread
    policy_scope(Entry).unread.count
  end

  def number_of_starred
    policy_scope(Entry).starred.count
  end

  def number_of_unread_in_category(category)
    policy_scope(Entry).with_category_id(category.id).unread.count
  end
end
