class Users::RegistrationsController < Devise::RegistrationsController
  # destroyアクションの動作前に、メールアドレスがゲストユーザー用になっていないかチェック
  before_action :ensure_normal_user, only: %i[update destroy]

  def ensure_normal_user
    if resource.email == 'test@example.com'
      redirect_to graphs_path, alert: 'ゲストユーザーは編集・削除できません。'
    end
  end

  # 新規登録後のリダイレクト先
  def after_sign_up_path_for(resource)
    graphs_path
  end
  
  # アカウント編集後のリダイレクト先
  def after_update_path_for(resource)
    graphs_path
  end

  protected

    # パスワードを入れずにアカウント情報を編集できるようにする
    # def after_update_path_for(resource, params)
    #   resource.update_without_password(params)
    # end
end