class Author < ActiveRecord::Base
  has_many :posts

  mount_uploader :avatar, AvatarUploader

  validates :name, :email, :profile, :presence => true
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }

  before_destroy :have_posts?

  # author Wawan Kurniawan <wawan@kuyainside.com>
  # Search author by name or email
  def self.search(str)
    if str
      where("name LIKE ? OR email LIKE ?", "%#{str}%", "%#{str}%")
    else
      scoped
    end
  end

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Prevent destroy when author have posts
  def have_posts?
    posts.blank?
  end
end
