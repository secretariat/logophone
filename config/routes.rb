Logophone::Application.routes.draw do
  devise_for :users
  root :to => 'page#index'

  get "creator/new"
  get "creator/show"

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
