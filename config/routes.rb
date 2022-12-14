Rails.application.routes.draw do
  root to: 'questions#index'

  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create destroy update]

  resources :questions do
    member do
      put :hide
      put :unhide
    end
  end
end
