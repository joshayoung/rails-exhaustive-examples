Rails.application.routes.draw do
  root "home#index"
  resources :teachers do
    resources :degrees
    resources :klasses
  end
  resources :students
end
