Rails.application.routes.draw do
  root to: 'questions#index'
  
  resources :questions

  put '/questions/:id/hide', to: 'questions#hide', as: 'hide_question'
  put '/questions/:id/unhide', to: 'questions#unhide', as: 'unhide_question'
end
