Rails.application.routes.draw do

  resources :articles do
    member do
      put "like", to: "articles#upvote"
      put "dislike", to: "articles#downvote"
    end
    resources :comments
  end


  root :to => 'home#index'

  devise_for :users
  match 'users/:id' => 'users#show', via: :get

  resources :users do
    resources :comments
  end

end
