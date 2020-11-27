Rails.application.routes.draw do
  devise_for :users

  resources :products, only: [:index, :show] do
    collection do
      get "search"
    end
  end

  resources :searches
  resources :welcome
  resources :cart, only: %i[create destroy]

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to:"welcome#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
