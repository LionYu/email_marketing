require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"

  resources :email_templates do
    member do
      post :publish
      post :take_off
    end
  end
  resources :users do
    member do
      post :send_ad_email
    end
  end
  resources :email_marketing_categories

  # Defines the root path route ("/")
  root "welcome#index"
end
