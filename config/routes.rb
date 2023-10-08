Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: proc { [200, {}, ["Job Service API #{Rails.env}"]] }

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :jobs
    end
  end
end
