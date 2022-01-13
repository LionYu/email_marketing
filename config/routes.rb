require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"

  resources :email_templates
  resources :users
  resources :email_marketing_categories

  # Defines the root path route ("/")
  root "welcome#index"
end
