class HomeController < ApplicationController
  def index
    artist = params[:artist].to_s
    title = params[:title].to_s
    @array = GetSong.new(artist, title).get_lyrics
  end
end