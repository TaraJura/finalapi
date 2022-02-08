Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      resources :visitors do 
        post "issue_card", on: :member
        post "return_card", on: :member
      end

      resources :cards
      resources :connectors
    end
  end
  resources :visitors
  root "client#index"
end
