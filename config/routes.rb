Rails.application.routes.draw do
  resources :articles do
    resources :comments
  end

  root :to => 'home#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :comments
  end
end
