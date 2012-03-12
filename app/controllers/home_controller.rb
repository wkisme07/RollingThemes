class HomeController < ApplicationController
  before_filter :get_post, :only => [:show, :send_comment]

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Home page
  def index
    @posts = Post.all_published.paginate(:page => params[:page], :per_page => 5)
  end

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Post detail page
  def show
    @comment = Comment.new
  end

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Post detail page
  def author
    @author = Author.find_by_id params[:id]
  end

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Post detail page
  def send_comment
    @comment = @post.comments.new(params[:comment])
    respond_to do |format|
      if @comment.save
        format.html{
          flash[:notice] = "Your comment need moderation."
          redirect_to "#{post_detail_path(@post)}#comment-#{@comment.id}"
        }
      else
        format.html{ render :action => :show }
      end
    end
  end

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Remove comment
  def remove_comment
    @comment = Comment.find_by_id params[:id]
    post = @comment.post
    flash[:notice] = @comment.destroy ? "Comment removed" : "Comment remove failed"
    redirect_to :back || post_detail_path(post)
  end

protected

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Get post
  def get_post
    @post = Post.find_by_id params[:id]
  end
end
