Rails.application.routes.draw do
  devise_for :users
  root "site#index"

  namespace :v1, defaults: { format: 'json' } do 
    resources :ranking
    resources :user
  end
end
