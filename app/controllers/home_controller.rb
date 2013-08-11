class HomeController < ApplicationController
  def index
  end
  def create
    artist = params[:artist]
    title = params[:title]
    @array = GetSong.new(artist, title).get_lyrics
    @message = "Sorry, not found." unless @array
  end
end