class Users::RegistrationsController < Devise::RegistrationsController
  # destroyアクションの動作前に、メールアドレスがゲストユーザー用になっていないかチェック
  before_action :ensure_normal_user, only: %i[update destroy]

  def ensure_normal_user
    # if resource.email == 'guest@example.com'
    if resource.email == 'test@example.com'
      redirect_to root_path, alert: 'ゲストユーザーは編集・削除できません。'
    end
  end
end