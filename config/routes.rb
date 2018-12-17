Rails.application.routes.draw do
  root :to => 'users#index'

  get '/signup' => 'users#new'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  resources :users, :only => [:create] do
    resources :accounts, :only => [:index, :show]
  end
  resources :articles, :only => [:index]
end
