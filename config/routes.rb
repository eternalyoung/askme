Rails.application.routes.draw do
  root to: 'questions#index'

  resource :session, only: %i[new create destroy]
  resources :users, except: %i[index], param: :nickname
  resources :tags, only: :show, param: :name

  resources :questions do
    member do
      put :hide
      put :unhide
    end
  end
end
