Rails.application.routes.draw do
  resources :interestings
  root "interestings#index"
end
