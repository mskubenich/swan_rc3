Rails.application.routes.draw do
  get 'pages/index'

  root :to => "pages#index"

  get '/admin', to: 'admin/pages#index'
end
