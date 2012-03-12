class Administrator::PostVersionsController < Administrator::ApplicationController
  authorize_resource

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Show all post version
  def index
    @post = Post.find_by_id params[:post_id]
    @versions = @post.post_versions.paginate :page => params[:page], :per_page => ITEM_PER_PAGE, :order => 'created_at DESC'
  end

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Version detail
  def show
    @version = PostVersion.find_by_id params[:id]
  end
end
