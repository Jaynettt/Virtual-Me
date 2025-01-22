Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "avatar_creator", to: "profiles#avatar_creator"
  post "profiles/save_avatar", to: "profiles#save_avatar"
  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "questions#index"
  resources :questions, only: [ :index, :create ] do
    resources :answers, only: [ :new, :create ]
  end
  resources :conversations, only: [ :show, :create ] do
    resources :messages
  end
  resources :profiles
  resources :virtual_personas
end
