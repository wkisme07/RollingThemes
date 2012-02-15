class Administrator::UsersController < Administrator::ApplicationController
  load_and_authorize_resource
  before_filter :prepare_data

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Show setting page for merchant user
  def account_setting
    authorize! :update, User
  end

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Update account
  def update_account
    authorize! :update, User

    action = params[:user][:current_password].blank? && params[:user][:password].blank? && params[:user][:password_confirmation].blank? ? 'update_without_password' : 'update_with_password'
    if @user.send(action, params[:user])
      flash[:notice] = "Account updated"
      sign_in(@user, :bypass => true) if action == 'update_with_password'
      redirect_to account_setting_administrator_users_path
    else
      render :action => :account_setting
    end
  end

  protected

  # @author Wawan Kurniawan <wawan@kuyainside.com>
  # Prepare data
  def prepare_data
    id = params[:id] || current_user.id
    @user = User.find_by_id(id)
  end

end
