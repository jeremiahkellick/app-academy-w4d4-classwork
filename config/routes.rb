Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :bands do
    resources :albums, only: [:new]
  end
  resources :albums, only: [:show, :create, :edit, :update, :destroy] do
    resources :tracks, only: [:new]
  end
  resources :tracks, only: [:create, :edit, :show, :update, :destroy] do
    resources :notes, only: [:create]
  end
  resources :notes, only: [:destroy]
  root "application#index"
end
