module EntriesHelper
  def css_class_for_entry(entry)
    classes = ["entry", entry.id]
    classes << "is_read" if entry.is_read?
    classes << "is_starred" if entry.is_starred?
    classes.sort.join(" ")
  end

  def link_to_entries_filter(type)
    url   = url_for @filter.to_h.merge(type: type)
    klass = (@filter.type == type ? "btn-primary" : "btn-outline-primary")

    link_to t(".filters.#{type}"), url, class: "btn btn-sm #{klass}"
  end
end
