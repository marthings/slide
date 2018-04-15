Rails.application.routes.draw do
  resources :presentations do
    resources :parts
  end
  devise_for :users
  
  root to: "pages#index"
end
