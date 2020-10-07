Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  get '/users/filter', to: 'users#filter'
  get '/users/search', to: 'users#search'
  get '/users', to: 'users#excel'
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  

 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
