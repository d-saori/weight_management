class ApplicationController < ActionController::Base
  # 全ページをログイン必須とする
  before_action :authenticate_user!

  protected

    def configure_permitted_parameters
      added_attrs = [:email, :password, :username, :age, :gender, :height, :weight]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
      devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
    end
end
