class Collection
  attr_reader :name_of_collection, :artists
  @@collections = []

  def Collection.create(name_of_collection)
    new_collection = Collection.new(name_of_collection)
    new_collection.save
    new_collection
  end

  def Collection.all
    @@collections
  end

  def Collection.clear
    @@collections = []
  end

  def Collection.search_for_artist(artist_search_term)
    result = ''
    @@collections.each do |col|
      col.artists.each do |art|
        if art.artist.start_with?(artist_search_term)
          result += "(" + col.name_of_collection + ") " + art.artist + ": " + art.albums.map { |album| album.album_name }.join(", ")
        end
      end
    end
    result
  end

  def Collection.search_for_album(album_search_term)
    result = ''
    @@collections.each do |col|
      col.artists.each do |art|
        art.albums.each do |alb|
          puts "herereerere"
          if alb.album_name.start_with?(album_search_term)
            result += "(" + col.name_of_collection + ") " + art.artist + ": " + alb.album_name
          end
        end
      end
    end
    result
  end

  def initialize(name_of_collection)
    @name_of_collection = name_of_collection
    @artists = []
  end

  def save
    @@collections << self
  end

  def create_artist_album(artist, album)
    new_artist = Artist.create(artist)
    new_album = new_artist.create_album(album)
    add_album(new_artist)
    new_artist
  end

  def add_album(a_album)
    @artists << a_album
  end

end
