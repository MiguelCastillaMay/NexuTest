Rails.application.routes.draw do
  get 'render/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "render#index"

  namespace :api do
    get "brands" => "brands#index"
    get "brands/:id/models" => "brands#models_by_brand"
    post "brands" => "brands#create"
    get "models" => "models#index"
    post "/brands/:id/models" => "models#create"
    put "models/:id" => "models#update"

    post 'scripts/populate_database', to: 'script#populate_database'
  end
end
