require_relative '../model/author'

describe Author do
  before :each do
    @box = Author.new(1, 'R. Martin', 'George R.')
    @car = Author.new(2, 'Clancy', 'Tom')
  end

  context 'New Author should be created' do
    it 'New Author should be Instance of Author' do
      expect(@box).to be_instance_of Author
      expect(@car).to be_instance_of Author
    end

    it 'Names should be classof String' do
      expect(@box.first_name).to be_kind_of String
      expect(@car.last_name).to be_kind_of String
    end
  end

  context 'Valid arguments Should be passed' do
    it 'should return string id' do
      author = Author.new(1, 'R. Martin', 'George R.')
      expect(author.id).to eq 1
    end

    it 'should return first name' do
      author = Author.new(1, 'R. Martin', 'George R.')
      expect(author.first_name).to eq 'R. Martin'
    end

    it 'should return last name' do
      author = Author.new(1, 'R. Martin', 'George R.')
      expect(author.last_name).to eq 'George R.'
    end
  end
end
