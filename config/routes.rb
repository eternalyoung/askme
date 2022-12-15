Rails.application.routes.draw do
  root to: 'questions#index'

  resource :session, only: %i[new create destroy]
  resources :users, except: %i[index]

  resources :questions do
    member do
      put :hide
      put :unhide
    end
  end
end
