class HomeController < ApplicationController
  def index
    artist = params[:artist].to_s
    title = params[:title].to_s
    song = GetSong.new(artist, title)
    song.words_list = song.remove_small_words
    @array = song.get_lyrics(100)
  end
end