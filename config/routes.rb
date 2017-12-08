Rails.application.routes.draw do

  mount StripeEvent::Engine, at: '/webhooks/stripe' 

  devise_for :users

  resources  :charges
  resources  :products
  resource   :subscription
  
  root to: "products#index"
end
