# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resource :messages, only: %i[new] do
    get :slideshow
  end

  # a test only route used by spec/features/it_works_spec.rb
  get "test_root", to: "rails/welcome#index", as: "test_root_rails"

  # Defines the root path route ("/")
  root "messages#index"
end
