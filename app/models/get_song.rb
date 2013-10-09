require 'lyricfy'

class GetSong

  attr_accessor :artist, :title, :words_list, :array

  def initialize(artist, title)
    @artist = artist
    @title = title

    fetcher = Lyricfy::Fetcher.new
    song = fetcher.search @artist, @title
    return nil unless song
    words = song.body(" ").to_s.downcase.gsub(/[^0-9a-z ]/i, '').split(" ").sort
    hash = {}
    words.each do |word|
      if hash[word]
          hash[word] += 1
      else
          hash[word] = 1
      end
    end
    @words_list = hash.sort_by{|k,v| v}.reverse
  end

  def get_lyrics(maxsize = -1)
    @array = []
    return nil unless @words_list
    @words_list.each do |i|
      @array.push "{text: \'#{i[0]}\', weight: #{i[1]}}"
    end
    @array[0..maxsize]
  end

  def remove_small_words(small_words = ["the", "i", "you", "and", "a"])
    new_list = []
    return nil unless @words_list
    @words_list.each do |x|
      unless small_words.include? x[0]
        new_list.push x
      end
    end
    @words_list = new_list
  end

  def correct_misspellings(corrections={"im"=>"I'm"})
    @words_list.each do |x|
      corrections.each do |y|
        if x[0] == y[0]
          x[0] = y[1]
        end
      end
    end
  end
    

end