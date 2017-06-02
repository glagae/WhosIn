Rails.application.routes.draw do

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  # Edit my profile page
  resources :users, only: [:edit, :update]

  # CRUD for events
  resources :events, except: [:index] do
      get 'addfreespot', on: :member, to: "events#addfreespot"
      get 'deletefreespot', on: :member, to: "events#deletefreespot"
    # CRUD for invitations
    resources :invitations, except: [:index, :show]
    get 'sendinvitation', to: "invitations#send_invitation", as: "send_invitation"
    # CRUD for menu items
    resources :menu_items, except: [:index, :show]
      get "/invitations/:id", to: "menu_items#brings", as: "brings_item"
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
