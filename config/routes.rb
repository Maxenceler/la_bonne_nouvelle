Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :projects do
    resources :bookings, only: :index
    member do
      get :chatbot
    end
  end
  resources :response_projects, only: :create
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
