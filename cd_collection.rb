require './lib/collection'
require './lib/artist'
require './lib/album'

def main_menu
  puts "****************************************"
  puts "*        CD - Collection               *"
  puts "****************************************"
  puts "* 'n' to add a new CD                  *"
  puts "* 'c' to search for a CD               *"
  puts "* 'a' to search for all CDs by artist  *"
  puts "* 'x' to exit                          *"
  puts "****************************************"
  puts "\n"
  main_choice = gets.chomp

  case main_choice

  when 'n'
    new_cd

  when 'c'

  when 'a'

  when 'x'
    exit
  else
    main_menu
  end
end

def new_cd
  puts "Name of artist?"
  name = gets.chomp
  puts "What genre is this artist?"
  genre = gets.chomp
  puts "Name of album?"
  album = gets.chomp

  if Collection.search(genre).length == 0
    new_collection = Collection.create(genre)
    new_album = new_collection.create_artist_album(name, album)
  else
    new_collection = Collection.search(genre)[0]
    new_album = Collection.search(genre)[0].create_artist_album(name, album)
  end

  system "clear"
  puts "Created (Genre) Artist: Album..."
  puts "(" + new_collection.name_of_collection + ") " + new_album.artist + ": " + new_album.albums.map { |alb| alb.album_name }.join(", ")
  puts "\n\n"
  main_menu

end
system "clear"
main_menu
