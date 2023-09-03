Rails.application.routes.draw do
  devise_for :users
  root "site#index"
  resources :rankings
  get "level/:level", to: "rankings#level_ranking", as: "level"

  namespace :v1, defaults: { format: 'json' } do 
    resources :ranking
    resources :user
  end
end
