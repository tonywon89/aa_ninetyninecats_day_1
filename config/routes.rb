Rails.application.routes.draw do
  resources :cats, only: [:index, :show, :new, :edit, :create, :update]

  root to: 'cats#index'
end
