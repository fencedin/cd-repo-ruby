require 'rspec'
require 'collection'
require 'cd'
require 'artist'

describe 'Collection' do
  before do
    Collection.clear
    CD.clear
    Artist.clear
  end
  it 'is an empty collection to start' do
    new_collection = Collection.new('Oldies')
    new_collection.should be_an_instance_of Collection
  end

  it 'has a name when it is created' do
    new_collection = Collection.new("Punk")
    new_collection.name_of_collection.should eq "Punk"
  end

  describe '.create' do
    it 'creates a new intance of collection' do
      new_collection = Collection.create('New Age')
      new_collection.should be_an_instance_of Collection
    end
  end

  describe '#save' do
    it 'saves a new collection to the class array of collections' do
      new_collection = Collection.create("Rockabilly")
      Collection.all.should eq [new_collection]
    end
  end

  describe '.all' do
    it 'calls the class array of collections' do
      Collection.all.should eq []
    end
  end

  describe '.clear' do
    it 'clears the collections array' do
      new_collection = Collection.create("k-pop")
      Collection.clear
      Collection.all.should eq []
    end
  end

  describe '#create_CD' do
    it 'creates a new CD in a CD collection' do
      new_collection = Collection.create("Country")
      new_collection.create_CD("Garth Brooks", "Thunder")
      new_collection.the_CD.should be_an_instance_of CD
    end
    it 'has an artist name' do
      new_collection= Collection.create('Rock')
      new_collection.create_CD("Björk", 'Icelandia')
      new_collection.the_CD.artist.artist_name.should eq "Björk"
    end
  end

  # describe '.search_for_artist' do
  #   it 'returns cds by this artist' do
  #     new_collection = Collection.create("Jazz")
  #     cd_one = new_collection.create_CD("Miles Davis", "Blue")
  #     cd_two = new_collection.create_CD("John Coltrane", 'Jazz Blues')
  #     Collection.search_for_artist('M').should eq [cd_one]
  #   end
  # end

end

describe 'CD' do
  before do
    CD.clear
  end
  it 'is an empty CD to start' do
    new_CD = CD.new("Michael Jackson", "Thriller")
    new_CD.should be_an_instance_of CD
  end

  it 'has a name when it is created' do
    new_CD = CD.new("Elton John", "Piano Man")
    new_CD.album.should eq "Piano Man"
    new_CD.artist.artist_name.should eq "Elton John"
  end

  describe '.create' do
    it 'creates a new instance of CD' do
      new_CD = CD.create("Chumbawumba", "WYSIWIG")
      new_CD.should be_an_instance_of CD
    end
    it 'creates a new instance of an artist' do
      new_CD = CD.create('Greenday', 'Dookie')
      new_CD.artist.should be_an_instance_of Artist
    end
  end
end

describe 'Artist' do
  before do
    Artist.clear
  end
  it 'is an empty artist to start' do
    new_artist = Artist.new('George Michael')
    new_artist.should be_an_instance_of Artist
  end

  it 'has a name when it is created' do
    new_artist = Artist.new("Billy Joel")
    new_artist.artist_name.should eq "Billy Joel"
  end

  describe '.create' do
    it 'creates a new intance of artist' do
      new_artist = Artist.create('Boa')
      new_artist.should be_an_instance_of Artist
    end
  end

  describe '#save' do
    it 'saves a new artist to the class array of artists' do
      new_artist = Artist.create("Michael Jackson")
      Artist.all.should eq [new_artist]
    end
  end

  describe '.all' do
    it 'calls the class array of artists' do
      Artist.all.should eq []
    end
  end

  describe '.clear' do
    it 'clears the artists array' do
      new_artist = Artist.create("Psy")
      Artist.clear
      Artist.all.should eq []
    end
  end
end
