Rails.application.routes.draw do

  devise_for :users
  root to: 'users#index'

  # Edit my profile page
  resources :users, only: [:edit, :update]

  # CRUD for events
  resources :events, except: [:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
