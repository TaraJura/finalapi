Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :visitors
      resources :cards
      resources :connectors

    end
  end

end
