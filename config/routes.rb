Rails.application.routes.draw do
  get 'sessions/new'

  get 'pages/index'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  root :to => "pages#index"

  resources :users, only: [:create, :show, :index]
  resources :sessions
  
  resources :friendship, only: [:create, :accept, :decline, :cancel, :delete] do
    collection do
      get :create
      get :accept
      get :decline
      get :cancel
      get :delete
    end
  end

  namespace :admin do
    resources :articles
  end

  get '/admin', to: 'admin/pages#index'

end
