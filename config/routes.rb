Rails.application.routes.draw do

  # Add static pages
  get "/pages/*page" => "pages#show", as: "pages"

  resources :presentations do
    resources :parts
  end

  # Use another controller to override redirects
  devise_for :users, controllers: { registrations: "registrations" }

  # Define another route for logged in users
  authenticated :user do
    root 'presentations#index'
  end

  root to: "pages#home"
end
