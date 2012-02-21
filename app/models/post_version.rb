class PostVersion < ActiveRecord::Base
  belongs_to :post
  belongs_to :author

  validates :title, :content, :presence => true

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Search post by title or content
  def self.search(search)
    if search
      where("title LIKE ? OR content LIKE ?", "%#{search}%", "%#{search}%")
    else
      scoped
    end
  end

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Get post-version status (draft|published)
  def status
    version == post.version ? 'published' : 'draft'
  end
end
