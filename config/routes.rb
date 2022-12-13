Rails.application.routes.draw do
  root to: 'questions#index'

  resources :users, only: %i[new create destroy]
  resource :session
  resources :questions do
    member do
      put :hide
      put :unhide
    end
  end
end
