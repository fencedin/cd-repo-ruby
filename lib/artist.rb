class Artist
  attr_reader :artist_name

  @@artists = []

  def Artist.all
    @@artists
  end

  def Artist.clear
    @@artists = []
  end

  def Artist.create(artist_name)
    new_artist = Artist.new(artist_name)
    new_artist.save
    new_artist
  end

  def initialize(artist_name)
    @artist_name = artist_name
  end

  def save
    @@artists << self
  end

end
