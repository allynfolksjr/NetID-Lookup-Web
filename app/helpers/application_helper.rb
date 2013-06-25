module ApplicationHelper
  def link_o_rate(url)
    "<a href='#{url}' target='_blank'>#{url}</a>".html_safe
  end
  def netid_url(webtype)
    link_o_rate("http://#{webtype}.washington.edu/#{@netid}")
  end
end
