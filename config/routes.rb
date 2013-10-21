Lyricscloud::Application.routes.draw do
  get 'home/index'
  post 'home/create'
  post 'home/create_album'
  post 'home/create_discography'

  root :to => 'home#index'

end
