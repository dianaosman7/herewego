Rails.application.routes.draw do
  devise_for :users

  resources :pins do
    resources :comments, only: %i[create destroy]
  end

  get "aboutus",   to: "homecontrol#aboutus"
  get "services",  to: "homecontrol#services"
  get "contact",   to: "homecontrol#contact"
  get "start-here", to: "homecontrol#start_here", as: :start_here

  root "homecontrol#home"

  get "up" => "rails/health#show", as: :rails_health_check
end