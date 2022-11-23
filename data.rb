require 'json'
require_relative './model/author'
require_relative './model/game'
class Data
  attr_accessor :games, :authors, :books, :labels

  def initialize
    @authors = []
    @games = []
    @books = []
    @labels = []
  end

  def add_author(author)
    new_author = { id: author.id, first_name: author.first_name, last_name: author.last_name }
    if File.exist?('./data/authors.json')
      authors = JSON.parse(File.read('./data/authors.json'))
      authors << new_author
      File.write('./data/authors.json', JSON.pretty_generate(authors))
    else
      File.write('./data/authors.json', JSON.pretty_generate([new_author]))
    end
  end

  def add_game(game)
    new_game = { id: game.id, publish_date: game.publish_date, multiplayer: game.multiplayer,
                 last_played_at: game.last_played_at, author_id: game.author.id }
    if File.exist?('./data/games.json')
      games = JSON.parse(File.read('./data/games.json'))
      games << new_game
      File.write('./data/games.json', JSON.pretty_generate(games))
    else
      File.write('./data/games.json', JSON.pretty_generate([new_game]))
    end
  end

  def add_book(book)
    new_book = { id: book.id, publish_date: book.publish_date, publisher: book.publisher,
                 cover_state: book.cover_state, label_id: book.label.id }
    if File.exist?('./data/books.json')
      books = JSON.parse(File.read('./data/books.json'))
      books << new_book
      File.write('./data/books.json', JSON.pretty_generate(books))
    else
      File.write('./data/books.json', JSON.pretty_generate([new_book]))
    end
  end

  def add_label(label)
    new_label = { id: label.id, title: label.title, color: label.color }
    if File.exist?('./data/labels.json')
      labels = JSON.parse(File.read('./data/labels.json'))
      labels << new_label
      File.write('./data/labels.json', JSON.pretty_generate(labels))
    else
      File.write('./data/labels.json', JSON.pretty_generate([new_label]))
    end
  end

  def load_authors
    return unless File.exist?('./data/authors.json')

    authors = JSON.parse(File.read('./data/authors.json'))
    authors.each do |author|
      new_author = Author.new(author['id'], author['first_name'], author['last_name'])
      @authors << new_author
    end
  end

  def load_games
    return unless File.exist?('./data/games.json')

    games = JSON.parse(File.read('./data/games.json'))
    games.each do |game|
      new_game = Game.new(game['id'], game['publish_date'], game['multiplayer'], game['last_played_at'])
      new_author = @authors.select { |author| author.id == game['author_id'] }[0]
      new_game.add_author(new_author)
      @games << new_game
    end
  end

  def load_books
    return unless File.exist?('./data/books.json')

    books = JSON.parse(File.read('./data/books.json'))
    books.each do |book|
      new_book = Book.new(book['id'], book['publish_date'], book['publisher'], book['cover_state'])
      new_label = @labels.select { |label| label.id == book['label_id'] }[0]
      new_book.add_label(new_label)
      @books << new_book
    end
  end

  def load_labels
    return unless File.exist?('./data/labels.json')

    labels = JSON.parse(File.read('./data/labels.json'))
    labels.each do |label|
      new_label = Label.new(label['id'], label['title'], label['color'])
      @books << new_label
    end
  end
end
