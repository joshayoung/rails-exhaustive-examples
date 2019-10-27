Rails.application.routes.draw do
  root "home#index"
  get "stats", to: "statistics#index"

  resources :teachers do
    resources :degrees
    resources :klasses
    member do
      get "teachers_students"
    end
  end
  resources :students do
    member do
      get "new_classes"
      post "add_classes"
    end
  end
end
