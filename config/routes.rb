# frozen_string_literal: true

Rails.application.routes.draw do
  post '/counties/bulk_upload', to: 'counties#bulk_upload'
  post '/states/bulk_upload', to: 'states#bulk_upload'

  resources :counties
  resources :states
end
