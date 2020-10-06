Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, except: :show
  
  resources :users, only: [:show, :update] do
    member do
      get 'mypage'
    end

    collection do
      resources :credit_cards, only:[:new, :show, :create, :destroy]
    end
  end
end
