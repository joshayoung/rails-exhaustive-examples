Rails.application.routes.draw do
  root "home#index"
  resources :klasses
  resources :teachers do
    resources :degrees
  end
  resources :students
end
