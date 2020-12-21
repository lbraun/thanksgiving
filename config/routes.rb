Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]

  root to: "home#show"

  resources :donations

  resources :recipients do
    resources :category_records
  end

  resources :users, only: [:index, :destroy] do
    get :approve, on: :member
    get :remove_approval, on: :member
    get :toggle_admin, on: :member
  end

  namespace :api do
    resources :recipients, only: [:index]
  end
end
