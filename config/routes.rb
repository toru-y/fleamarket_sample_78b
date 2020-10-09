Rails.application.routes.draw do
  devise_for :users
  root 'items#index'

  resources :items do 
    #Ajaxで動くアクションのルートを作成
    collection do
      get 'category/get_category_children', to: 'items#get_category_children', defaults: { format: 'json' }
      get 'category/get_category_grandchildren', to: 'items#get_category_grandchildren', defaults: { format: 'json' }
    end
  end

  resources :users, only: [:show, :update] do
    member do
      get 'mypage'
    end

    collection do
      resources :credit_cards, only:[:new, :show, :create, :destroy]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
