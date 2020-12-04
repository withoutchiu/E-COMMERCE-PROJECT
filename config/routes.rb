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

  scope "/checkout" do
    post "create", to: "checkout#create", as: "checkout_create"
    get "success", to: "checkout#success", as: "checkout_success"
    get "cancel", to: "checkout#cancel", as: "checkout_cancel"
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to:"welcome#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
