Rails.application.routes.draw do
  get 'sessions/new'

  get 'pages/index'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  root :to => "pages#index"

  resources :users
  resources :sessions

  get '/admin', to: 'admin/pages#index'

end
