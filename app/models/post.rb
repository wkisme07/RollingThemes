class Post < ActiveRecord::Base
  belongs_to :author
  has_many :post_versions, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  validates :title, :author_id, :content, :presence => true

  before_create :set_version
  after_create :create_version

  scope :all_published, where("published = ?", true)

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
  # All approved comments
  def approved_comments
    comments.where("approved = ?", true)
  end

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Build version before create
  def create_version
    post_versions.create(
      :version    => 1,
      :author_id  => author_id,
      :title      => title,
      :content    => content
    )
  end

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Set version post on create
  def set_version
    self.version = 1 if published
  end

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Get last version created
  def last_version
    post_versions.last
  end

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Get last version number or 0
  def last_version_number
    last_version.version || 0
  end

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Publish post as the vnumber given
  def publish(pv)
    update_attributes(:version => pv.version, :title => pv.title, :author_id => pv.author_id, :content => pv.content, :published => true)
  end

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Post status
  def status
    published ? 'published' : 'draft'
  end
end
