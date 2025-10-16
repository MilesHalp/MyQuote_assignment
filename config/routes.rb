# Miles Halpine 10607950
# Routes file that deals with URL requests

Rails.application.routes.draw do
  # Routes that send admins and standard users to the correct home
  get '/admin', to: 'home#aindex'
  get '/userhome', to: 'home#uindex'
  # Route to the user's quotes
  get '/your-quotes', to: 'home#uquotes'
  # Routes for when a user starts and ends a new session
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # Route for when a user searches a category
  get 'search', to: 'search#index'
  # get "search/index"
  resources :categories
  resources :quotes
  resources :philosophers
  resources :users
  #get "home/index"
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
