Rails.application.routes.draw do
  root "contacts#index"

  devise_for :users

  resources :contacts, only: [:index, :destroy] do
    collection { post 'import' }
  end
end
