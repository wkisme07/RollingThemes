class Administrator::TagsController < Administrator::ApplicationController
  load_and_authorize_resource

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Show all tags
  def index
    @tags = Tag.paginate :page => params[:page], :per_page => ITEM_PER_PAGE
  end

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # New Tag
  def new
    @tag = Tag.new
    render :partial => 'form', :layout => false
  end

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Create Tag
  def create
    @tag = Tag.new(params[:tag])
    respond_to do |format|
      if @tag.save
        flash[:notice] = "Tag saved"
        format.html{ redirect_to :action => :index }
        format.js{ render 'administrator/application/facebox-redirect' }
      else
        @template = '/administrator/tags/_form.html'
        format.html{ render :partial => 'form' }
        format.js{ render 'administrator/application/facebox-reprocess'}
      end
    end
  end

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Edit Tag
  def edit
    render :partial => 'form', :layout => false
  end

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Edit Tag
  def update
    respond_to do |format|
      if @tag.update_attributes(params[:tag])
        flash[:notice] = "Tag updated"
        format.html{ redirect_to :action => :index }
        format.js{ render 'administrator/application/facebox-redirect' }
      else
        @template = 'administrator/tags/_form.html'
        format.html{ render :partial => 'form' }
        format.js{ render 'administrator/application/facebox-reprocess' }
      end
    end
  end

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Edit Tag
  def destroy
    flash[:notice] = @tag.destroy ? "Tag removed" : "Failed to remove tag"
    redirect_to :action => :index
  end

  protected

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Prepare data
  def prepare_data
    @tag = Tag.find_by_id(params[:id])
  end
end
