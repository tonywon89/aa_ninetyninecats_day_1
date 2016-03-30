Rails.application.routes.draw do
  resources :cats, only: [:index, :show, :new, :edit, :create, :update, :destroy] do
    resources :cat_rental_requests, only: [:index]
  end

  resources :cat_rental_requests, only: [:show, :new, :edit, :create, :update, :destroy]

  patch '/cat_rental_request/:id/approve', to: 'cat_rental_requests#approve', as: 'approve'
    patch '/cat_rental_request/:id/deny', to: 'cat_rental_requests#deny', as: 'deny'
  root to: 'cats#index'
end
