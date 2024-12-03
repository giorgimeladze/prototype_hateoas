module ArticleLinks

  def show_links
    [
      {
        name: 'Edit',
        action: 'GET',
        href: "/articles/#{self.id}/edit"
      },
      {
        name: 'Back to Listings',
        action: 'GET',
        href: "/articles"
      }
    ]
  end

  def new_links
    [
      {
        name: 'Back to Listings',
        action: 'GET',
        href: "/articles"
      }
    ]
  end

  def edit_links
    [
      {
        name: 'Back to Article',
        action: 'GET',
        href: "/articles/#{self.id}/edit"
      }
    ]
  end

  def index_links
    [
      {
        name: 'Show',
        action: 'GET',
        href: "/articles/#{self.id}"
      },
      {
        name: 'Edit',
        action: 'GET',
        href: "/articles/#{self.id}/edit"
      },
      {
        name: 'Delete',
        action: 'DELETE',
        href: "/articles/#{self.id}"
      }
    ]
  end

  def self.general_index
    [      
      {
        name: 'New',
        action: 'GET',
        href: '/articles/new'
      }
    ]
  end
end