Rails.application.routes.draw do
  get 'sessions/new'

  get 'pages/index'

  get 'users/edit'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  root :to => "pages#index"

  resources :users
  resources :sessions

  namespace :admin do
    resources :articles
    resources :news
  end

  get '/admin', to: 'admin/pages#index'

end
