require 'pry'

class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

def initialize(name)
  @name = name 
  @songs = []
end

def self.all
  @@all 
end 

def self.destroy_all 
  @@all.clear
end 

def save
@@all << self
end 

def self.create(name)
  new_genre = Genre.new(name)
  new_genre.save
  new_genre
end
 
def add_song(song)
  if song.genre == nil
      song.genre = self
  end 
  @songs << song unless @songs.include?(song)
end

def artists
  @songs.map{ |song| song.artist}.uniq
end 

end