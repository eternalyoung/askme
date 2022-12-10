Rails.application.routes.draw do
  root to: 'questions#index'
  
  resources :questions do
    put '/questions/:id/hide'
    put '/questions/:id/unhide'
  end
end
