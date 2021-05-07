class ApplicationController < ActionController::Base
  # 全ページをログイン必須とする
  before_action :authenticate_user!, except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?
  # CSRFへの対策
  protect_from_forgery with: :exception

  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    if resource.is_a?(AdminUser)
      admin_root_path
    else
      graphs_path
    end
  end

  protected

    def configure_permitted_parameters
      added_attrs = [:email, :password, :password_confirmation]
      devise_parameter_sanitizer.permit :sign_up, keys: [added_attrs, :username]
      devise_parameter_sanitizer.permit :account_update, keys: [added_attrs, :username, :age, :gender, :height, :weight, :profile, :target_weight, :target_body, :avatar]
      devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
    end
end
