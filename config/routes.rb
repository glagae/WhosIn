Rails.application.routes.draw do

  get 'comments/new'

  get 'comments/create'

  get 'comments/update'

  get 'comments/destroy'

  get 'comments/edit'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  # Edit my profile page
  resources :users, only: [:edit, :update]
  post 'createnewuser', to:"users#createnewuser", as: "email_friend"

  # CRUD for events
  resources :events, except: [:index] do
      post 'addfreespot', on: :member, to: "events#addfreespot"
      post 'deletefreespot', on: :member, to: "events#deletefreespot"
    # CRUD for invitations
    resources :invitations, except: [:index, :show]
    get 'sendinvitation', to: "invitations#send_invitation", as: "send_invitation"
    # CRUD for menu items
    resources :menu_items, except: [:index, :show]
      get "/invitations/:id", to: "menu_items#brings", as: "brings_item"
      get "/invitations/:id", to: "menu_items#unbrings", as: "unbrings_item"
    # CRUD for comments
    resources :comments, except: [:index, :show]
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
