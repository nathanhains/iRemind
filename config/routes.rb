Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :reminders, only: [:index, :create, :destroy]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :lists, only: [:index, :create]
    end
  end
end
