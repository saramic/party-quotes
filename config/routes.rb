# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :messages, only: %i[new create show edit update] do
    collection do
      get :slideshow
    end
  end

  # a test only route used by spec/features/it_works_spec.rb
  get "test_root", to: "rails/welcome#index", as: "test_root_rails"

  # Defines the root path route ("/")
  root "messages#index"
end
