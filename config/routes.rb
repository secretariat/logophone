Logophone::Application.routes.draw do

  devise_for :users
  root :to => 'page#index'

  get "cabinet/index"
  get "cabinet/intro"
  get "cabinet/info"
  get "cabinet/training"
  get "cabinet/table"
  get "cabinet/test"

  # get "creator/new"
  # get "creator/show"
  resources :creator, only: [ :index, :new, :create, :show]

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
