Logophone::Application.routes.draw do
  root :to => 'page#index'
  devise_for :users

  get "creator/new"
  get "creator/show"

  get "page/index"
  get "page/elements"
  get "page/login"
  get "page/register"
  get "page/download"
  get "page/decoder"
  get "page/creator"
  get "page/create_logo"
  get "page/contacts"
  get "page/feedback"

  match ':controller(/:action(/:id))(.:format)'
end
