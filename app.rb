require './model/book'
require './model/game'
require './model/music_album'
require './model/author'
require './data'

class App
  def initialize
    @data = Data.new
    @data.load_authors
    @data.load_games
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
end
