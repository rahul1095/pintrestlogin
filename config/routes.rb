Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match '/auth/:provider/callback', :to => 'home#index', via: [:get, :post]
end
