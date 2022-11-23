require_relative '../model/book'

describe Book do
  before :each do
    @book1 = Book.new(10, '2006-09-13', 'MacMillan', 'good')
    @book2 = Book.new(0o6, '2017-11-10', 'Packt', 'bad')
    @book3 = Book.new(0o6, '2015-08-15', 'Packt', 'good')
  end

  context 'tests the constructor method' do
    it 'New Book should be Instance of Book' do
      expect(@book1).to be_instance_of Book
      expect(@book2).to be_instance_of Book
      expect(@book3).to be_instance_of Book
    end
  end

  context 'tests the can_be_archived method' do
    it 'should return true' do
      expect(@book1.send(:can_be_archived?)).to eq true
      expect(@book2.send(:can_be_archived?)).to eq true
    end
    it 'should return false' do
      expect(@book3.send(:can_be_archived?)).to eq false
    end
  end
end
