Logophone::Application.routes.draw do

  devise_for :users
  root :to => 'page#index'

  get "cabinet/index"
  get "cabinet/intro"
  get "cabinet/info"
  get "cabinet/training"
  get "cabinet/table"
  get "cabinet/test"
  get "cabinet/test_show"
  get "cabinet/intro_show"
  get "cabinet/training_show"
  get "cabinet/tester"

  get "creator/new"
  get "creator/show"
  get "creator/destroy"
  # resources :creator, only: [ :index, :new, :create, :show]

  get "page/index"
  get "page/elements"
  get "page/login"
  get "page/register"
  get "page/download"
  get "page/decoder"
  get "page/contacts"
  get "page/feedback"
  get "page/how"
  get "page/like"
  get "page/aboutl"
  get "decoder/background"
  get "decoder/character"
  get "decoder/sunglasses"

  match ':controller(/:action(/:id))(.:format)'
end
