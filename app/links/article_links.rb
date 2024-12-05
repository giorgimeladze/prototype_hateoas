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
        href: "/articles/#{self.id}"
      }
    ]
  end

  def index_links(current_user)
    actions = []
    policy = ArticlePolicy.new(current_user, self)
    actions << {name: 'Show', action: 'GET', href: "/articles/#{self.id}"}
    actions << {name: 'Edit', action: 'GET', href: "/articles/#{self.id}/edit"} if policy.edit?
    actions << {name: 'Delete', action: 'DELETE', href: "/articles/#{self.id}"} if policy.destroy?
    actions 
  end

  def self.general_index(current_user)
    links = []
  
    if ArticlePolicy.new(current_user, self).new?
      links << {
        name: 'New',
        action: 'GET',
        href: '/articles/new'
      }
    end
  
    if current_user
      links << {
        name: 'Logout',
        action: 'DELETE',
        href: '/users/sign_out'
      }
    else
      links << {
        name: 'Login',
        action: 'GET',
        href: '/users/sign_in'
      }
    end
  
    links
  end
end
