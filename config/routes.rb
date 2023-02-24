Rails.application.routes.draw do
  get 'postsaves/index'
  get 'admins/index'
  get 'comments/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
  }
  resources :posts do
    resources :comments
    resources :postsaves
    get "create", to: "postsaves#create", as: :create_order  
  end
    

  
  resources :admins do
    member do
      get :userprofile
      post :userpage
    end
    
  end
  root 'home#index'
  get "/home/ufile", to:"home#ufile"
  get "/home/yoga", to:"home#yoga"
  get "/home/food", to:"home#food"
  get "/home/historical",to:"home#historical"
  get "/home/userprofile", to: "home#profile"
  get "/home/userpage",to:"home#userpage"
  get "/home/usersave", to:"home#usersave"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
