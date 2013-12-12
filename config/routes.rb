Logophone::Application.routes.draw do
<<<<<<< HEAD
  devise_for :users
  root :to => 'page#index'

  get "creator/new"
  get "creator/show"
=======
  root :to => 'page#index'
  devise_for :users

  get "creator/new"
  get "creator/show"

>>>>>>> 3fd8172cd4b363b390500e403a8792470260dbd3
  get "page/index"
  get "page/elements"
  get "page/login"
  get "page/register"
  get "page/download"
  get "page/decoder"
  get "page/contacts"
  get "page/feedback"

  match ':controller(/:action(/:id))(.:format)'
end
