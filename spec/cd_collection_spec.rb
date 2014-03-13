require 'rspec'
require 'collection'
require 'artist'
require 'album'

# describe 'Collection' do
#   before do
#     Collection.clear
#     CD.clear
#     Album.clear
#   end
#   it 'is an empty collection to start' do
#     new_collection = Collection.new('Oldies')
#     new_collection.should be_an_instance_of Collection
#   end

#   it 'has a name when it is created' do
#     new_collection = Collection.new("Punk")
#     new_collection.name_of_collection.should eq "Punk"
#   end

#   describe '.create' do
#     it 'creates a new intance of collection' do
#       new_collection = Collection.create('New Age')
#       new_collection.should be_an_instance_of Collection
#     end
#   end

#   describe '#save' do
#     it 'saves a new collection to the class array of collections' do
#       new_collection = Collection.create("Rockabilly")
#       Collection.all.should eq [new_collection]
#     end
#   end

#   describe '.all' do
#     it 'calls the class array of collections' do
#       Collection.all.should eq []
#     end
#   end

#   describe '.clear' do
#     it 'clears the collections array' do
#       new_collection = Collection.create("k-pop")
#       Collection.clear
#       Collection.all.should eq []
#     end
#   end

#   describe '#create_CD' do
#     it 'creates a new CD in a CD collection' do
#       new_collection = Collection.create("Country")
#       new_collection.create_CD("Garth Brooks", "Thunder")
#       new_collection.the_CD.should be_an_instance_of CD
#     end
#     it 'has an artist name' do
#       new_collection= Collection.create('Rock')
#       new_collection.create_CD("Björk", 'Icelandia')
#       new_collection.the_CD.artist.artist_name.should eq "Björk"
#     end
#   end

#   describe '#add_CD' do
#     it 'adds a created CD to the CD Array' do
#       new_collection = Collection.create("Pop")
#       new_CD = new_collection.create_CD("Justin Timberlake", "20/20 Experience")
#       new_collection.add_CD(new_CD)
#       new_collection.cds.should eq [new_CD]
#     end
#   end

#   # describe '.search_for_artist' do
#   #   it 'returns cds by this artist' do
#   #     new_collection = Collection.create("Jazz")
#   #     cd_one = new_collection.create_CD("Miles Davis", "Blue")
#   #     cd_two = new_collection.create_CD("John Coltrane", 'Jazz Blues')
#   #     Collection.search_for_artist('M').should eq [cd_one]
#   #   end
#   # end

# end

describe 'Artist' do
  before do
    Artist.clear
  end
  it 'is an empty artist to start' do
    new_artist = Artist.new("Michael Jackson")
    new_artist.should be_an_instance_of Artist
  end

  it 'has a artist with an album when it is created' do
    new_artist = Artist.new("Elton John")
    new_album = new_artist.create_album("Piano Man")
    new_artist.albums[0].should eq new_album
    new_artist.artist.should eq "Elton John"
  end

  describe '.create' do
    it 'creates a new instance of artist' do
      new_artist = Artist.create("Chumbawumba")
      new_artist.should be_an_instance_of Artist
    end
    it 'creates a new instance of an album' do
      new_artist = Artist.create('Greenday')
      new_album = new_artist.create_album('Dookie')
      new_album.should be_an_instance_of Album
    end
  end
end

describe 'Album' do
  before do
    Album.clear
  end
  it 'is an empty album to start' do
    new_album = Album.new('George Michael')
    new_album.should be_an_instance_of Album
  end

  it 'has a name when it is created' do
    new_album = Album.new("Billy Joel")
    new_album.album_name.should eq "Billy Joel"
  end

  describe '.create' do
    it 'creates a new intance of Album' do
      new_album = Album.create('Boa')
      new_album.should be_an_instance_of Album
    end
  end

  describe '#save' do
    it 'saves a new Album to the class array of albums' do
      new_album = Album.create("Michael Jackson")
      Album.all.should eq [new_album]
    end
  end

  describe '.all' do
    it 'calls the class array of albums' do
      Album.all.should eq []
    end
  end

  describe '.clear' do
    it 'clears the albums array' do
      new_album = Album.create("Psy")
      Album.clear
      Album.all.should eq []
    end
  end
end
