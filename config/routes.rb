Rails.application.routes.draw do
  resources :email_templates
  resources :users
  resources :email_marketing_categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"
end
