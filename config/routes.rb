Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tasks
  resources :comments

  post '/get_user/'  => 'users#show'
  post '/update_user' => 'users#update_user'
end
