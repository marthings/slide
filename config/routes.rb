Rails.application.routes.draw do
  resources :presentations
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "presentations#index"
end
