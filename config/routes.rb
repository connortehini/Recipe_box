Rails.application.routes.draw do
  root "recipes#index"

  resources :recipes do 
    resources :rankings
  end 
  resources :ingredients
  resources :tags
  
end
