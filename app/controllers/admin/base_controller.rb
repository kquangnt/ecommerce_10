class Admin::BaseController < ApplicationController
  before_action :logged_in_user
  before_action :check_admin_permission

  def check_admin_permission
    unless current_user.admin? || current_user.manager?
      flash[:danger] = t "admin.base.denied"
      redirect_to root_url
    end
  end
  
  def logged_in_user
    unless user_signed_in?
      flash[:danger] = t "admin.base.no_loggin_error"
      redirect_to new_user_session_path
    end
  end
end
