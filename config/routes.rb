Rails.application.routes.draw do
  root to: 'questions#index'
  
  resources :questions do
    put '/questions/:id/hide', to: 'questions#hide'
    put '/questions/:id/unhide', to: 'questions#unhide'
  end
end
