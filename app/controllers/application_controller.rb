class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_categories

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit :name, :address, :phone_number, :email, :password,
        :password_confirmation, :image
    end

    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit :name, :address, :phone_number, :email, :password, 
        :password_confirmation, :current_password, :image
    end
  end

  def get_categories
    @categories = Category.all
  end  
end
