class Administrator::CategoriesController < Administrator::ApplicationController
  load_and_authorize_resource

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Show all categories
  def index
    @categories = Category.paginate :page => params[:page], :per_page => ITEM_PER_PAGE
  end

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # New Category
  def new
    @category = Category.new
    render :partial => 'form', :layout => false
  end

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Create Category
  def create
    @category = Category.new(params[:category])
    respond_to do |format|
      if @category.save
        flash[:notice] = "Category saved"
        format.html{ redirect_to :action => :index }
        format.js{ render 'administrator/application/facebox-redirect' }
      else
        @template = '/administrator/categories/_form.html'
        format.html{ render :partial => 'form' }
        format.js{ render 'administrator/application/facebox-reprocess'}
      end
    end
  end

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Edit Category
  def edit
    render :partial => 'form', :layout => false
  end

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Edit Category
  def update
    respond_to do |format|
      if @category.update_attributes(params[:category])
        flash[:notice] = "Category updated"
        format.html{ redirect_to :action => :index }
        format.js{ render 'administrator/application/facebox-redirect' }
      else
        @template = 'administrator/categories/_form.html'
        format.html{ render :partial => 'form' }
        format.js{ render 'administrator/application/facebox-reprocess' }
      end
    end
  end

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Edit Category
  def destroy
    flash[:notice] = @category.destroy ? "Category removed" : "Failed to remove category"
    redirect_to :action => :index
  end

  protected

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Prepare data
  def prepare_data
    @category = Category.find_by_id(params[:id])
  end
end
