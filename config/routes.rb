Rails.application.routes.draw do
  root to: 'home#index'
  namespace :api do
    resources :todos, only: [:index, :create, :update, :destroy]
  end
end
