class Comment < ActiveRecord::Base
  belongs_to :post

  validates :post_id, :name, :email, :content, :presence => true
end
