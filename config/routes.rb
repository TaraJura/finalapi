Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      jsonapi_resources :visitors
      jsonapi_resources :cards
      jsonapi_resources :connectors

    end
  end

end
