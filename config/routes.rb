Rails.application.routes.draw do
  get "/pages/*page" => "pages#show", as: "pages"

  resources :presentations do
    resources :parts
  end
  devise_for :users
  
  root to: "pages#home"
end
