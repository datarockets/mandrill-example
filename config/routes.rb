Rails.application.routes.draw do
  devise_for :users

  resources :vacancies, only: [:show, :create, :new] do
    resource :request, only: :create
  end

  resources :requests, only: [:index, :show] do
    resources :messages, only: [:create]
  end

  namespace :employer do
    resources :requests, only: [:index, :show] do
      resources :messages, only: [:create]
    end
  end

  root 'vacancies#index'
end
