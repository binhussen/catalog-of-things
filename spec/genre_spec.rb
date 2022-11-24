require_relative '../model/genre'

describe Genre do
  before :each do
    @genre1 = Genre.new(1, 'Rap')
    @genre2 = Genre.new(2, 'Adventure')
  end

  it 'should be an instance of Genre' do
    expect(@genre1).to be_instance_of Genre
    expect(@genre2).to be_instance_of Genre
  end

  it 'should have an id' do
    genre = Genre.new(1, 'Rap')
    expect(genre.id).to eq 1
  end

  it 'should have a name' do
    genre = Genre.new(1, 'Rap')
    expect(genre.name).to eq 'Rap'
  end
end
