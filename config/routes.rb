Rails.application.routes.draw do
  resources :degrees
  resources :klasses
  resources :teachers
  resources :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
