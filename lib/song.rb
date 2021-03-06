require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    @@all << song 
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song 
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song 
  end

    def self.find_by_name(name)
      self.all.find {|s| s.name == name}
    end

    def self.find_or_create_by_name(name)
      if self.find_by_name(name)
        return self.find_by_name(name)
      else
        self.create_by_name(name)
      end
    end

    def self.alphabetical
      self.all.sort_by {|s| s.name}
    end

    def self.new_from_filename(file_name)
      artist = file_name.split(/ -/).first 
      name = file_name.split(/ - /)[1].split(/.mp3/).first
      song = Song.new_by_name(name)
      song.artist_name = artist 
      song
    end

    def self.create_from_filename(file_name)
      song = self.new_from_filename(file_name)
      song.save
    end

    def self.destroy_all
      self.all.clear
    end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end



end
