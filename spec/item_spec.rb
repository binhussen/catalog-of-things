require_relative '../model/item'
require_relative '../model/genre'

describe Item do
  before :each do
    @book = Item.new(nil, '2022-01-02')
    @album = Item.new('2001-03-05', nil)
    @game = Item.new(nil, '2002-09-10')
    @genre = Genre.new(nil, 'Horror')
    @author = Author.new(nil, 'John', 'Doe')
    @label = Label.new(nil, 'Label', 'red')
  end

  context 'tests the Item class'
  it 'adds a new genre' do
    @genre.add_genre(@album)
    expect(@genre.items).to include(@album)
  end

  it 'adds a new author' do
    @author.add_author(@book)
    expect(@author.items).to include(@book)
  end

  it 'adds a new label' do
    @label.add_label(@game)
    expect(@label.items).to include(@game)
  end

  it 'checks whether item can be archived' do
    expect(@album.can_be_archived?).to be true
  end

  it 'can be moved to archive' do
    @album.move_to_archive
    expect(@album.archived).to be true
  end
end
