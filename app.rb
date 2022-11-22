require './model/book'
require './model/game'
require './model/music_album'
require './model/genre'
require './model/author'
require './data'

class App
  def initialize
    @data = Data.new
    @data.load_authors
    @data.load_games
    @data.load_albums
    @data.load_genres
  end

  def add_author
    puts 'Enter first name'
    first_name = gets.chomp
    puts 'Enter last name'
    last_name = gets.chomp
    new_author = Author.new(nil, first_name, last_name)
    @data.add_author(new_author)
    @data.authors << new_author
    new_author
  end

  def add_game
    puts 'Is it multiplayer [Y / N]'
    multiplayer = gets.chomp.downcase == 'y'
    puts 'Enter last played at in format (YYYY-MM-DD)'
    last_played_at = Date.parse(gets.chomp)
    puts 'Enter the publish date in format (YYYY-MM-DD)'
    publish_date = Date.parse(gets.chomp)
    new_game = Game.new(nil, publish_date, multiplayer, last_played_at)
    puts "Enter author details\n"
    new_author = add_author
    new_game.add_author(new_author)
    @data.add_game(new_game)
    @data.games << new_game
    puts 'Game created successfully'
  end

  def display_authors
    return puts 'No authors found' if @data.authors.empty?

    @data.authors.each_with_index do |author, index|
      puts "#{index + 1}) First Name: #{author.first_name}, Last Name: #{author.last_name}"
    end
  end

  def display_games
    return puts 'No games found' if @data.games.empty?

    @data.games.each_with_index do |game, index|
      puts "#{index + 1}) Author: #{game.author.first_name} #{game.author.last_name}"
      puts "Multiplayer: #{game.multiplayer}, Last played: #{game.last_played_at}, Publish date: #{game.publish_date}"
    end
  end

  def add_album
    puts 'Add New Album'
    puts 'Publish Date: [YYYY-MM-DD]'
    date = gets.chomp
    puts 'Can be archived? [Y/N]'
    archived = gets.chomp.upcase == 'Y'
    puts 'On spotify? [Y/N]'
    spotify = gets.chomp.upcase == 'Y'
    album = MusicAlbum.new(date, archived, spotify)
    genre = add_genre
    genre.add_item(album)
    @data.albums << album
    puts 'Album created successfully'
  end

  def add_genre
    puts "Add Genre\n\n"
    puts 'Genre name:'
    genre_name = gets.chomp
    genre = Genre.new(genre_name)
    @data.genres << genre
    genre
  end

  def display_genres
    return puts 'No genres found' if @data.genres.empty?

    @data.genres.each_with_index do |genre, index|
      puts "#{index + 1}) Name: #{genre.name}"
    end
  end

  def display_albums
    return puts 'No albums found' if @data.albums.empty?

    @data.albums.each_with_index do |album, index|
      puts "#{index + 1}) Publish date: #{album.publish_date}, Archived: #{album.archived}, On spotify: #{album.on_spotify}"
    end
  end
end
