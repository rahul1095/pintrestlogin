Rails.application.routes.draw do
  resources :locations
  resources :articles
  resources :posts
  devise_for :users, controllers: { confirmations: 'confirmations' }
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match '/auth/:provider/callback', :to => 'home#index', via: [:get, :post]
end


