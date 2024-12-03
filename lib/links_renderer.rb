module LinksRenderer
  include ActionView::Helpers::UrlHelper

  def render_links(links)
    links.map do |link|
      case link[:action]
      when 'GET'
        link_to link[:name].capitalize, link[:href]
      when 'DELETE'
        link_to link[:name].capitalize, link[:href], method: :delete, data: { confirm: 'Are you sure?' }
      end
    end.join(' ').html_safe
  end
end
