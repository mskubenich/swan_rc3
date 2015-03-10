Rails.application.routes.draw do
  get 'pages/index'

  root :to => "pages#index"

  namespace :admin do
    resources :pages, only: [:index]
  end
end
