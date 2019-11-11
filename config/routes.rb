Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :products
      resources :orders, only: [:create]
      resources :issues, only: [:create]
    end
  end
end
