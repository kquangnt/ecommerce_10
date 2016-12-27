class Admin::UsersController < Admin::BaseController
  load_and_authorize_resource

  def index
    @users = User.order_desc.paginate page: params[:page],
      per_page: Settings.user.per_page
  end

  def update
    if @user.update_attribute :role, params[:role]
      flash[:success] = t "admin.users.update.updated", role: params[:role]
    else
      flash[:danger] = t "admin.users.update.error"
    end
    redirect_to :back
  end
  
  def destroy
    if @user.destroy
      flash[:success] = t "admin.users.destroy.deleted"
    else
      flash[:danger] = t "admin.users.destroy.error"
    end
    redirect_to admin_users_path
  end
end
