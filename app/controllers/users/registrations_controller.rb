class Users::RegistrationsController < Devise::RegistrationsController
  # destroyアクションの動作前に、メールアドレスがゲストユーザー用になっていないかチェック
  before_action :ensure_normal_user, only: %i[update destroy]

  def ensure_normal_user
    if resource.email == 'test@example.com'
      redirect_to root_path, alert: 'ゲストユーザーは編集・削除できません。'
    end
  end

  protected

    # パスワードを入れずにアカウント情報を編集できるようにする
    # def after_update_path_for(resource, params)
    #   resource.update_without_password(params)
    # end
end