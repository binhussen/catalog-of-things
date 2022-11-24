require_relative '../model/genre'

describe Genre do
  before(:each) do
    @genre = Genre.new('Rap')
  end

  it 'should be an instance of Genre' do
    expect(@genre).to be_an_instance_of(Genre)
  end

  it 'should have a name' do
    expect(@genre.name).to eq('Rap')
  end

  it 'should have an id' do
    expect(@genre.id).not_to be_nil
  end

  it 'should have an empty array of items' do
    expect(@genre.item).to eq([])
  end

  it 'should add an item to the array of items' do
    item = double('item')
    @genre.add_item(item)
    expect(@genre.item).to eq([item])
  end
end
