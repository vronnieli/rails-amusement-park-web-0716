Rails.application.routes.draw do
  resources :users
  resources :attractions, only: [:index, :show, :new, :create, :edit, :update]


  root 'users#index'

  post '/attractions/:id', to: 'attractions#ride'

  get '/signin', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'

end
