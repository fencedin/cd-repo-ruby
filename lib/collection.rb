class Collection
  attr_reader :name_of_collection, :the_CD
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

  # def Collection.search_for_artist(artist_search_term)
  #   @@collections.each do |col|
  #     @the_CD.each do ||
  # end

  def initialize(name_of_collection)
    @name_of_collection = name_of_collection
  end

  def save
    @@collections << self
  end

  def create_CD(artist, album)
    @the_CD = CD.create(artist, album)
    @the_CD
  end


end
