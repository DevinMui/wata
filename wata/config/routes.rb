Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :water_usages
    end
  end
  resources :water_usages
  root 'water_usages#index'
end
