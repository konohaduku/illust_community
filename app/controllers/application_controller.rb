class ApplicationController < ActionController::Base
  # before_action :authenticate_user!, except: [:top, :about]
  # before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery
  private

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    elsif resource_or_scope == :user
      new_user_session_path
    else
      super
    end
  end
end
