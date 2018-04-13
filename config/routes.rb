Rails.application.routes.draw do
  resources :presentations do
    resources :parts
  end
  devise_for :users
  
  root to: "presentations#index"
end
