class HomeController < ApplicationController
  def index
  end

  def create
    artist = params[:artist].to_s
    title = params[:title].to_s
    song = GetSong.new(artist, title)
    song.words_list = song.remove_small_words
    @array = song.get_lyrics(100)
    render "index"
  end

  def create_album
    artist = params[:artist].to_s
    title = params[:title].to_s
    song = GetAlbum.new(artist, title)
    song.words_list = song.remove_small_words
    @array = song.get_lyrics(100)
    render "index"
  end

  def create_discography
    artist = params[:artist].to_s
    song = GetDiscography.new(artist)
    song.words_list = song.remove_small_words
    @array = song.get_lyrics(100)
    render "index"
  end

end