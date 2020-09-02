Rails.application.routes.draw do
  devise_for :labo_users
  resources :labo_items
  root 'items#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
