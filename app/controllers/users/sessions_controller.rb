class Users::SessionsController < Devise::SessionsController
  def guest_sign_in
    user = User.guest
    # ログイン(deviseのメソッド)
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザとしてログインしました。'
  end
end