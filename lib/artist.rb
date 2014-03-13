class Artist

  attr_reader :artist, :albums
  @@artist_all = []

  def Artist.create(artist)
    new_artist = Artist.new(artist)
    new_artist.save_artist
    new_artist
  end

  def Artist.all
    @@artist_all
  end

  def Artist.clear
    @@artist_all = []
  end

  def initialize(artist)
    @artist = artist
    @albums = []
  end

  def create_album(album)
    new_album = Album.create(album)
    add_album(new_album)
    new_album
  end

  def save_artist
    @@artist_all << self
  end

  def add_album(an_album)
    @albums << an_album
  end
end
