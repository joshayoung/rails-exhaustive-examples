Rails.application.routes.draw do
  root "home#index"
  resources :degrees
  resources :klasses
  resources :teachers
  resources :students
end
