Rails.application.routes.draw do
  get 'users/new'

  get 'pages/index'

  root :to => "pages#index"
  match '/signup',  to: 'users#new',            via: 'get'
  get '/admin', to: 'admin/pages#index'
end
