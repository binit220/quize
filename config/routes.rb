Rails.application.routes.draw do
  
  root "quizzes#index"

  resources :quizzes do
    resources :questions do
      resources :options
    end
  end
end
