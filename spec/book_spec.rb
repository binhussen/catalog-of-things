require_relative '../model/book'

describe Book do
  before :each do
    @book1 = Book.new(10, '2006-09-13', 'MacMillan', 'good')
    @book2 = Book.new(0o6, '2017-11-10', 'Packt', 'bad')
    @book3 = Book.new(0o6, '2015-08-15', 'Packt', 'good')
  end

  context 'New Book should be created' do
    it 'New Book should be Instance of Book' do
      expect(@book1).to be_instance_of Book
      expect(@book2).to be_instance_of Book
      expect(@book3).to be_instance_of Book
    end
  end

  context 'tests the publisher method' do
    it 'should return publisher' do
      expect(@book1.publisher).to eq 'MacMillan'
      expect(@book2.publisher).to eq 'Packt'
      expect(@book3.publisher).to eq 'Packt'
    end
  end

  context 'tests the cover_state method' do
    it 'should return cover_state' do
      expect(@book1.cover_state).to eq 'good'
      expect(@book2.cover_state).to eq 'bad'
      expect(@book3.cover_state).to eq 'good'
    end
  end
end
