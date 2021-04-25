class UsersController < ApplicationController
  def index
    @users = User.order(id: :asc)
  end

  def show
    @user = current_user
  end

  def edit
  end
end
