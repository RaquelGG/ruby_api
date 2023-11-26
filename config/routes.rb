Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  delete "locations/:host", to: "locations#destroy_by_host", as: :destroy_by_host, constraints: {host: /[a-zA-Z0-9_\.-]+/}
  get "locations/:host", to: "locations#show_by_host", as: :show_by_host, constraints: {host: /[a-zA-Z0-9_\.-]+/}
  jsonapi_resources :locations, only: [:create]
  
end
