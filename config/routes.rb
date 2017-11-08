Rails.application.routes.draw do
  root 'transactions#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :transactions, only: [:index, :new, :create]
end
