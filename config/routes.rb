# frozen_string_literal: true

Rails.application.routes.draw do
  post '/counties/bulk_upload', to: 'counties#bulk_upload'
  post '/states/bulk_upload', to: 'states#bulk_upload'

  get '/counties/:name', to: 'counties#index'
  get '/states/:name', to: 'states#index'

  resources :counties, only: [:index]
  resources :states, only: [:index]
end
