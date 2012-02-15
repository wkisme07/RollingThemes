class Post < ActiveRecord::Base
  belongs_to :author
  has_many :post_versions
  has_many :comments
end
