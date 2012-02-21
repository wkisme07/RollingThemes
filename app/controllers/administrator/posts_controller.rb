class Administrator::PostsController < Administrator::ApplicationController
  load_resource :only => [:index, :new, :create, :destroy]
  authorize_resource
  before_filter :prepare_data, :only => [:edit, :update, :publish]

  # @post Wawan Kurniawan <wawan@kuyainside.com>
  # Post lists
  def index
    @posts = Post.search(params[:search]).paginate(:page => params[:page], :per_page => ITEM_PER_PAGE, :order => 'created_at DESC')
  end

  # @post Wawan Kurniawan <wawan@kuyainside.com>
  # New post
  def new
    @post = Post.new
  end

  # @post Wawan Kurniawan <wawan@kuyainside.com>
  # Save post
  def create
    @post = Post.new(params[:post].merge(:published => params[:submit] == 'save-n-publish'))
    respond_to do |format|
      if @post.save
        flash[:notice] = "Post saved"
        format.html{ redirect_to administrator_posts_path }
        format.js{ render 'administrator/application/facebox-redirect'}
      else
        @template = 'administrator/posts/new.html'
        format.html{ render :action => :new }
        format.js{ render 'administrator/application/facebox-reprocess'}
      end
    end
  end

  # @post Wawan Kurniawan <wawan@kuyainside.com>
  # Edit post
  def edit
  end

  # @post Wawan Kurniawan <wawan@kuyainside.com>
  # Update post
  def update
    @post_version.attributes = params[:post_version]
    respond_to do |format|
      unless @post_version.changed?
        updated = @post_version.update_attributes(params[:post_version])
      else
        updated = PostVersion.create(params[:post_version].merge(:version => @post_version.version + 1))
      end

      if updated
        flash[:notice] = "Post updated"
        format.html{ redirect_to administrator_posts_path }
        format.js{ render 'administrator/application/facebox-redirect'}
      else
        flash[:notice] = "Update Post failed"
        @template = 'administrator/posts/edit.html'
        format.html{ render :action => :edit }
        format.js{ render 'administrator/application/facebox-reprocess'}
      end
    end
  end

  # @post Wawan Kurniawan <wawan@kuyainside.com>
  # Remove post
  def destroy
    flash[:notice] = @post.destroy ? "Post removed" : "Remove post failed"
    redirect_to :action => :index
  end

  # @auhtor Wawan Kurniawan <wawan@kuyainside.com>
  # Publish spesific version
  def publish
    flash[:notice] = @post_version.post.publish(@post_version) ? "Post published" : "Post publish failed"
    redirect_to administrator_posts_path
  end

  protected

  # @post Wawan Kurniawan <wawan@kuyainside.com>
  # Prepare variable
  def prepare_data
    @post_version = PostVersion.find_by_id params[:id]
  end
end
