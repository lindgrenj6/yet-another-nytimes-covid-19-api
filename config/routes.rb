# frozen_string_literal: true

Rails.application.routes.draw do
  post '/states/bulk_upload', to: 'states#bulk_upload'

  get '/states/:name', to: 'states#index'

  resources :states, only: [:index]
  resources :uss, only: [:index]
end
