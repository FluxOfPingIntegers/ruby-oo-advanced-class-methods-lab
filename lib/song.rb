require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    @@all << self.new
    @@all[-1]
  end

  def self.new_by_name(name)
    self.create.name = "#{name}"
    @@all[-1]
  end

  def self.create_by_name(name)
    self.new_by_name(name)
  end

  def self.find_by_name(name)
    Song.all.find {|songs| songs.name == name}
  end

  def self.find_or_create_by_name(name)
   self.create_by_name(name)
   self.find_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|i| i.name}
  end

  def self.new_from_filename(filename)
    filename = filename.split(" - ")
    filename[1] = filename[1].delete_suffix(".mp3")
    x = self.find_or_create_by_name(filename[1])
    x.artist_name=(filename[0])
    x
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

  def self.destroy_all
    @@all.clear
  end

end