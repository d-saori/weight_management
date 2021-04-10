class Users::RegistrationsController < Devise::RegistrationsController
  # destroyアクションの動作前に、メールアドレスがゲストユーザー用になっていないかチェック
  before_action :ensure_normal_user, only: :destroy

  def ensure_normal_user
    if resource.email == 'guest@example.com'
      redirect_to root_path, alert; 'ゲストユーザーは削除できません。'
  end
end