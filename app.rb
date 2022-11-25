require './model/book'
require './model/game'
require './model/music_album'
require './model/genre'
require './model/author'
require './model/label'
require './data'

class App
  def initialize
    @data = Data.new
    @data.load_authors
    @data.load_games
    @data.load_albums
    @data.load_genres
    @data.load_books
    @data.load_labels
  end

  def add_author
    puts 'Enter first name'
    first_name = gets.chomp
    puts 'Enter last name'
    last_name = gets.chomp
    new_author = Author.new(nil, first_name, last_name)
    @data.authors << new_author
    @data.add_author(new_author)
    new_author
  end

  def add_game
    puts 'Is it multiplayer [Y / N]'
    multiplayer = gets.chomp.downcase == 'y'
    puts 'Enter last played at:'
    last_played_at = gets.chomp
    puts 'Enter the publish date in:'
    publish_date = gets.chomp
    new_game = Game.new(nil, publish_date, multiplayer, last_played_at)
    puts "Enter author details\n"
    new_author = add_author
    new_game.add_author(new_author)
    @data.games << new_game
    @data.add_game(new_game)
    puts 'Game created successfully'
  end

  def add_book
    puts 'Enter publisher'
    publisher = gets.chomp
    puts 'Enter publish date'
    publish_date = gets.chomp
    puts 'Enter the cover state'
    cover_state = gets.chomp
    new_book = Book.new(nil, publish_date, publisher, cover_state)
    puts "Enter label details\n"
    new_label = add_label
    new_book.add_label(new_label)
    @data.books << new_book
    @data.add_book(new_book)
    puts 'Book created successfully'
  end

  def add_label
    puts 'Enter title'
    title = gets.chomp
    puts 'Enter color'
    color = gets.chomp
    new_label = Label.new(nil, title, color)
    @data.labels << new_label
    @data.add_label(new_label)
    new_label
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
    puts 'Publish Date:'
    date = gets.chomp
    puts 'On spotify? [Y/N]'
    spotify = gets.chomp.upcase == 'Y'
    new_album = MusicAlbum.new(date, spotify, nil)
    puts "Enter Gener details\n"
    new_genre = add_genre
    new_album.add_genre(new_genre)
    @data.albums << new_album
    @data.add_album(new_album)
    puts 'Album created successfully'
  end

  def add_genre
    puts "Add Genre\n"
    puts 'Genre name:'
    genre_name = gets.chomp
    new_genre = Genre.new(nil, genre_name)
    @data.genres << new_genre
    @data.add_genre(new_genre)
    new_genre
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
      puts "#{index + 1}) Genre: #{album.genre.name} , On spotify: #{album.on_spotify}"
      puts "Publish date: #{album.publish_date}"
    end
  end

  def display_books
    return puts 'No books found' if @data.books.empty?

    @data.books.each_with_index do |book, index|
      puts "#{index + 1})Publisher: #{book.publisher}"
      puts "Cover state: #{book.cover_state}, Publish date: #{book.publish_date}"
    end
  end

  def display_labels
    return puts 'No labels found' if @data.labels.empty?

    @data.labels.each_with_index do |label, index|
      puts "#{index + 1}) Title: #{label.title}, Color: #{label.color}"
    end
  end
end
