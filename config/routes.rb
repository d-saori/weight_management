Rails.application.routes.draw do
  root 'graphs#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  # updateに「:id」は不要なのでresource「s」ではない事に注意
  resource :graphs, only: %i[index create update]
end
