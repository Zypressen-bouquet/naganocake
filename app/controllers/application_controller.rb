class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      added_attrs = [:last_name,:first_name,:last_name_kana,:first_name_kana,:post_code,:email,:address,:phone_number,:status]
      devise_parameter_sanitizer.permit(:sign_up,keys: added_attrs)
    end

    def after_sign_in_path_for(resource)
      case resource
      when Admin
        admin_homes_top_path
      when User
        root_path
      end
    end

    def after_sign_out_path_for(resource_or_scope)
      if resource_or_scope == :admin
        new_admin_session_path
      else
        new_user_session_path
      end
  end


end