Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  # Edit my profile page
  resources :users, only: [:edit, :update]

  # CRUD for events
  resources :events, except: [:index] do
    # CRUD for invitations
    resources :invitations, except: [:index, :show]
    # CRUD for menu items
    resources :menu_items, except: [:index, :show]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
