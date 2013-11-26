Logophone::Application.routes.draw do
  root :to => 'page#index'
  get "page/index"
  get "page/elements"
  get "page/login"
  get "page/register"
  get "page/download"
  get "page/decoder"
  get "page/creator"
  get "page/contacts"

  match ':controller(/:action(/:id))(.:format)'
end
