Rails.application.routes.draw do

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

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

  get "/events/:event_id/invitations/:id", to: "menu_items#brings", as: "brings_item"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
