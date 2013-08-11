Lyricscloud::Application.routes.draw do
  get "home/index"
  get "home/create"

  root :to => 'home#index'

end
