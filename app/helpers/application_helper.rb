module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Budgeteer"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  # def link_away(name, options = {}, html_options = nil)
  #   link_to(name, { :return_uri => url_for(:only_path => true) }.update(options.symbolize_keys), html_options)
  # end
  def link_away(name, options = {}, html_options = nil)
    link = case options
        when String
            link_to(name, options + "?return_uri=" + url_for(:only_path => true), html_options)
        else
            link_to(name, { :return_uri => url_for(:only_path => true) }.update(options.symbolize_keys), html_options)
        end
   end
end