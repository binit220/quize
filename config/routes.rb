Rails.application.routes.draw do
  
  root "quizes#index"

  resources :quizes
end
