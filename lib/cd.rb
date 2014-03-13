class CD

  attr_reader :artist, :album
  @@cd_all = []

  def CD.create(artist, album)
    new_CD = CD.new(artist, album)
    new_CD
  end

  def CD.all
    @@cd_all
  end

  def CD.clear
    @@cd_all = []
  end

  def initialize(artist, album)
    @artist = new_artist(artist)
    @album = album
  end

  def new_artist(artist)
    new_artist = Artist.create(artist)
    new_artist
  end

  def save_CD
    @@cd_all << self
  end

end
