class Administrator::CommentsController < Administrator::ApplicationController
  authorize_resource
  before_filter :prepare_data

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Create comment
  def create
    @comment = @post.comments.new(params[:comment].merge(:name => 'Admin', :email => current_user.email, :approved => true))
    respond_to do |format|
      if @comment.save
        format.html{
          flash[:notice] = "Comment sent."
          redirect_to administrator_post_path(@post)
        }
      else
        format.html{ render '/administrator/posts/show.html' }
      end
    end
  end

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Approve comment
  def approve
    @comment = Comment.find_by_id params[:id]
    flash[:notice] = @comment.update_attribute('approved', true) ? "Comment approved" : "Comment approve failed"
    redirect_to :back || administrator_post_path(@post)
  end

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Remove comment
  def destroy
    @comment = Comment.find_by_id params[:id]
    flash[:notice] = @comment.destroy ? "Comment removed" : "Comment remove failed"
    redirect_to :back || administrator_post_path(@post)
  end

protected

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Get post
  def prepare_data
    @post = Post.find_by_id params[:post_id]
  end
end
