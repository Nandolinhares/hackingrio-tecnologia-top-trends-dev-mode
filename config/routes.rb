Rails.application.routes.draw do
  resources :juridicas
  resources :fisicas
  root "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
