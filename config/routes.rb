Rails.application.routes.draw do
  resources :cats, only: [:index, :show, :new, :edit, :create, :update, :destroy] do
    resources :cat_rental_requests, only: [:index]
  end

  resources :cat_rental_requests, only: [:show, :new, :edit, :create, :update, :destroy]
  root to: 'cats#index'
end
