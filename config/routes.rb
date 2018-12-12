Rails.application.routes.draw do
  root :to => 'articles#index'
  
  get '/signup' => 'users#new'
  post'/users' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  resources :articles
end
