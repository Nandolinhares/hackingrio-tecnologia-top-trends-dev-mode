Rails.application.routes.draw do
  resources :juridicas do
    resources :socios, except: [:index, :show]
  end
  resources :fisicas
  get '/search' => 'home#search', :defaults => { :format => 'json'},  :as => :searchs
  root "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
