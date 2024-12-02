class ArticleLinks

  def self.show(article)
    [
      {
        name: 'Edit',
        action: 'get',
        href: "/articles/#{article.id}/edit"
      },
      {
        name: 'Back to Listings',
        action: 'get',
        href: "/articles"
      }
    ]
  end

  def self.index(article)
    [
      {
        name: 'Show',
        action: 'get',
        href: "/articles/#{article.id}"
      },
      {
        name: 'Edit',
        action: 'get',
        href: "/articles/#{article.id}/edit"
      },
      {
        name: 'Delete',
        action: 'delete',
        href: "/articles/#{article.id}"
      }
    ]
  end

  def self.general_index
    [      
      {
        name: 'New',
        action: 'get',
        href: '/articles/new'
      }
    ]
  end
end