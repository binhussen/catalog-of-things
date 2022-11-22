require './model/book'
require './model/game'
require './model/music_album'

class App
  def initialize
    @books = []
    @music_albums = []
    @games = []
  end

  def choose_task
    puts 'Please choose an option by entering a number:'
    options = ['List all books', 'List all music albums', 'List all games',
               "List all genres (e.g 'Comedy', 'Thriller')", "List all labels (e.g. 'Gift', 'New')",
               "List all authors (e.g. 'Stephen King')", 'Add a book', 'Add a music album', 'Add a game']
    options.each.with_index(1) do |option, index|
      puts "#{index} - #{option}"
    end
  end

  # def do_task(input)
  #   case input
  #   when 1 then list_books
  #   when 2 then list_albums
  #   when 3 then list_games
  #   when 4 then list_genres
  #   when 5 then list_labels
  #   when 6 then list_authors
  #   when 7 then add_book
  #   when 8 then add_album
  #   when 9 then add_game
  #   end
  # end
end
