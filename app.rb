require './model/book'
require './model/game'
require './model/music_album'
require './model/author'
require './model/label'
require './data'

class App
  def initialize
    @data = Data.new
    @data.load_authors
    @data.load_games
    @data.load_books
    @data.load_labels
  end

  def inputs(show)
    outputs = []
    show.each do |s|
      print s
      outputs.push(gets.chomp)
    end
    outputs
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

  def add_book
    puts 'Enter publisher'
    publisher = gets.chomp
    puts 'Enter publish date in format (YYYY-MM-DD)'
    publish_date = Date.parse(gets.chomp)
    puts 'Enter the cover state'
    cover_state = gets.chomp
    new_book = Book.new(nil, publish_date, publisher, cover_state)
    puts "Enter label details\n"
    new_label = add_label
    new_book.add_label(new_label)
    @data.add_book(new_book)
    @data.books << new_book
    puts 'Book created successfully'
  end

  def add_label
    puts 'Enter title'
    title = gets.chomp
    puts 'Enter color'
    color = gets.chomp
    new_label = Label.new(nil, title, color)
    @data.add_label(new_label)
    @data.labels << new_label
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

  def display_books
    return puts 'No labels found' if @data.books.empty?

    @data.books.each_with_index do |book, index|
      puts "#{index + 1}) Label: #{book.label.title} #{book.label.color}"
      puts "Publisher: #{book.publisher}, Publish date: #{book.publish_date} Cover_state: #{book.cover_state}"
    end
  end

  def display_labels
    return puts 'No labels found' if @data.labels.empty?

    @data.labels.each_with_index do |label, index|
      puts "#{index + 1}) Id: #{label.id} Title: #{label.title} Color: #{label.color}"
    end
  end
end
