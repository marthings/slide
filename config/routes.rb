Rails.application.routes.draw do

  # Add static pages
  get "/pages/*page" => "pages#show", as: "pages"
  
  resources :presentations, except: [:index] do
    resources :parts
    # module: lets us have /presentations/likes/likes_controller.rb
    resource :like, module: :presentations
  end

  # Use another controller to override redirects
  devise_for :users, controllers: { registrations: "registrations" }
  resources :users, only: [:show]
  # Define another route for logged in users
  # authenticated :user do
  #   root "pages#home"
  # end

  root to: "pages#home"
end
