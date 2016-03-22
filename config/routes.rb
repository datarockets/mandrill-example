Rails.application.routes.draw do
  devise_for :users

  resources :vacancies, only: [:show, :create, :new] do
    resource :request, only: :create
  end

  resources :requests, only: [:index, :show]

  namespace :employer do
    resources :requests, only: [:index, :show]
  end

  root 'vacancies#index'
end
