Rails.application.routes.draw do
  devise_for :users
  root 'graphs#index'
  # updateに「:id」は不要なのでresource「s」ではない事に注意
  resource :graphs, only: %i[index create update]
end
