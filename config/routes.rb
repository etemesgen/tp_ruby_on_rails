Rails.application.routes.draw do
  resources :users
  resources :tasks, only: [:new, :create, :edit, :update, :destroy]

  get 'inscription', to: 'users#new'
  get 'inscription', to: 'users#create'
  get 'connexion', to: 'sessions#new'
  post 'connexion', to: 'sessions#create'
  delete 'deconnexion', to: 'sessions#destroy'
  get 'dashboard', to: 'pages#dashboard'
  get 'faq', to: 'pages#faq'
  get 'contact', to: 'pages#contact'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "pages#accueil"
end
