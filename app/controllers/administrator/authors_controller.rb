class Administrator::AuthorsController < Administrator::ApplicationController
  load_and_authorize_resource
  before_filter :prepare_data, :only => [:edit, :update, :destroy]

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Author lists
  def index
    @authors = Author.search(params[:search]).paginate(:page => params[:page], :per_page => ITEM_PER_PAGE)
  end

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # New author
  def new
    @author = Author.new
    render :partial => 'form', :layout => false
  end

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Save author
  def create
    @author = Author.new(params[:author])
    respond_to do |format|
      if @author.save
        flash[:notice] = "Author saved"
        format.html{ redirect_to administrator_authors_path }
        format.js{ render 'administrator/application/facebox-redirect'}
      else
        @template = 'administrator/authors/_form.html'
        format.html{ render :partial => 'form' }
        format.js{ render 'administrator/application/facebox-reprocess'}
      end
    end
  end

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Edit author
  def edit
    render :partial => 'form', :layout => false
  end

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Update author
  def update
    respond_to do |format|
      if @author.update_attributes(params[:author])
        flash[:notice] = "Author updated"
        format.html{ redirect_to administrator_authors_path }
        format.js{ render 'administrator/application/facebox-redirect'}
      else
        @template = 'administrator/authors/_form.html'
        format.html{ render :partial => 'form' }
        format.js{ render 'administrator/application/facebox-reprocess'}
      end
    end
  end

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Remove author
  def destroy
    flash[:notice] = @author.destroy ? "Author removed" : "Remove author failed"
    redirect_to :action => :index
  end

  protected

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Prepare variable
  def prepare_data
    @author = Author.find_by_id params[:id]
  end
end
