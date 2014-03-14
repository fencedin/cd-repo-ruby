require './lib/collection'
require './lib/artist'
require './lib/album'

def main_menu
  puts " ****************************************"
  puts " *        CD - Collection               *"
  puts " ****************************************"
  puts " * 'n' to add a new CD                  *"
  puts " * 'c' to search for an artist          *"
  puts " * 'a' to search for an album           *"
  puts " * 'g' to display a genre               *"
  puts " * 'x' to exit                          *"
  puts " ****************************************"
  puts "\n"
  main_choice = gets.chomp

  case main_choice
  when 'n'
    new_cd
  when 'c'
    search_for_artist
  when 'a'
    search_for_album
  when 'g'
    display_genre
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

  puts "\nCreated (Genre) Artist: Album..."
  puts "(" + new_collection.name_of_collection + ") " + new_album.artist + ": " + new_album.albums.map { |alb| alb.album_name }.join(", ")
  puts "\n\n"
  gets.chomp
  system "clear"
  main_menu
end

def search_for_artist
  puts "\nWhat artist are you looking for?"
  search_item = gets.chomp
  result = Collection.search_for_artist(search_item)

  puts "\n" + result[0][0].artist + "\n\t" + result[0][0].albums.map { |alb| alb.album_name }.join(", ")
  gets.chomp
  system "clear"
  main_menu
end

def search_for_album
  puts "\nWhat album are you looking for?"
  search_item = gets.chomp
  result = Collection.search_for_album(search_item)

  puts "\n" + result[0].artist + "\n\t" + result[0].albums[0].album_name
  gets.chomp
  system "clear"
  main_menu
end

def display_genre
  puts "What genre?"
  search_item = gets.chomp
  result = Collection.search(search_item)[0]

  puts "\n" + result.artists[0].artist + "\n\t" + result.artists[0].albums[0].album_name

end


system "clear"
main_menu
