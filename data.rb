require 'json'
require_relative './model/author'
require_relative './model/game'
require_relative './model/music_album'
require_relative './model/genre'
class Data
  attr_accessor :games, :authors, :albums, :genres

  def initialize
    @authors = []
    @games = []
    @albums = []
    @genres = []
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

  def add_album(album)
    new_album = { id: album.id, publish_date: album.publish_date, archived: album.archived, on_spotify: album.on_spotify }
    if File.exist?('./data/albums.json')
      albums = JSON.parse(File.read('./data/albums.json'))
      albums << new_album
      File.write('./data/albums.json', JSON.pretty_generate(albums))
    else
      File.write('./data/albums.json', JSON.pretty_generate([new_album]))
    end
  end

  def load_albums
    return unless File.exist?('./data/albums.json')

    albums = JSON.parse(File.read('./data/albums.json'))
    albums.each do |album|
      new_album = MusicAlbum.new(album['id'], album['publish_date'], album['archived'], album['on_spotify'])
      @albums << new_album
    end
  end

  def add_genre(genre)
    new_genre = { id: genre.id, name: genre.name }
    if File.exist?('./data/genres.json')
      genres = JSON.parse(File.read('./data/genres.json'))
      genres << new_genre
      File.write('./data/genres.json', JSON.pretty_generate(genres))
    else
      File.write('./data/genres.json', JSON.pretty_generate([new_genre]))
    end
  end

  def load_genres
    return unless File.exist?('./data/genres.json')

    genres = JSON.parse(File.read('./data/genres.json'))
    genres.each do |genre|
      new_genre = Genre.new(genre['id'], genre['name'])
      @genres << new_genre
    end
  end
end
