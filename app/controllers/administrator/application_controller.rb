class Administrator::ApplicationController < ApplicationController
  layout 'administrator'
  before_filter :authenticate_user!

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Administrator index page
  def index
  end

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Remove selected data
  def destroy_selection
    object = params[:object].constantize
    flash[:notice] = 'Data removed' if !params[:selection].blank? && object.delete_all(["id IN (?)", params[:selection]])

    redirect_to params[:redirect_url] || administrator_root_path
  end


  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Redirect to administrator home page if permission denied
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to administrator_root_url, :alert => exception.message
  end
end
