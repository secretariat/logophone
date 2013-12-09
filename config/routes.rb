Logophone::Application.routes.draw do
  get "creator/new"

  get "creator/show"

  root :to => 'page#index'
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
