Rails.application.routes.draw do
  root :to => 'users#index'

  get '/signup' => 'users#new'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
  get '/users/:user_id/accounts_validate' => 'accounts#validate'
  get '/users/:user_id/restore_account' => 'accounts#restore'

  resources :users, :only => [:create] do
    resources :accounts, :only => [:index, :show, :new, :create]
  end
  resources :articles, :only => [:index]
end
