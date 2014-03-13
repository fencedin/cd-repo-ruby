class Album
  attr_reader :album_name

  @@albums = []

  def Album.all
    @@albums
  end

  def Album.clear
    @@albums = []
  end

  def Album.create(album_name)
    new_album = Album.new(album_name)
    new_album.save
    new_album
  end

  def initialize(album_name)
    @album_name = album_name
  end

  def save
    @@albums << self
  end

end
