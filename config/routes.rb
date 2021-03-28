Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/auth'
  mount ActionCable.server => '/cable'

  namespace :api do
    resources :messages, only: %i[index create]
  end
end
