Rails.application.routes.draw do
  #root "site#index"
  root "contacts#index"

  devise_for :users

  resources :contacts do#, only: [:index, :create, :destroy, :update] do
    collection { post 'import' }
  end

  namespace :api do
    namespace :v1 do
      resources :contacts, only: [:index, :create, :destroy, :update] do
        collection { post 'import' }
      end
    end
  end
end
