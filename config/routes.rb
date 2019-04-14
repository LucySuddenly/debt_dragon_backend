Rails.application.routes.draw do
  resources :debts
  resources :plans
  resources :users
  post "/selectPlan", to: "helper#selectPlan" 
  post "/returnPlan", to: "helper#returnPlan"
  post "/users", to: 'users#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
