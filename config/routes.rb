Rails.application.routes.draw do
  get 'users/show'
  root 'homes#top'

  devise_for :users, controllers: {
    registrations: 'users/registrations', passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  # updateに「:id」は不要なのでresource「s」ではない事に注意
  resource :graphs, only: %i[create update]
  resources :graphs, only: [:index]
  resources :users, only: [:show]
end
