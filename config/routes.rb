Rails.application.routes.draw do
  get 'sessions/new'

  get 'pages/index'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  root :to => "pages#index"

  resources :users
  resources :sessions
  resources :news
  get '/admin', to: 'admin/pages#index'
  get '/admin/news', to: 'admin/pages#news'
end
