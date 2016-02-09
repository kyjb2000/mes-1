Rails.application.routes.draw do

  resources :answers
  resources :attempts
  devise_for :users, controllers: {registrations: 'registrations'}

  authenticated :user do
    devise_scope :user do
      root to: "surveys#index"
      get '/users/sign_out' => 'devise/sessions#destroy'
    end
  end

  get "/dashboard", to: "users#dashboard"
  resources :users
  resources :surveys do
    collection do
      get :browse
    end

  end

  unauthenticated do
  devise_scope :user do
    root to: "devise/sessions#new", :as => "unauthenticated"
  end
 end
end
