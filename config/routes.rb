Rails.application.routes.draw do
  root :to => 'users#index'

  get '/signup' => 'users#new'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
  get '/users/:user_id/accounts_validate' => 'users#validate'
  get '/users/:user_id/restore_account' => 'users#restore'

  resources :networks, :only => [:index]
  resources :users, :only => [:create, :update, :show] do
    resources :accounts, :only => [:show, :new, :create]
  end
  resources :articles, :only => [:index]
  resources :accounts, :only => [] do
    resource :addresses
  end
end
