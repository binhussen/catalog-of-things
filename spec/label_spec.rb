require_relative '../model/label'

describe Label do
  before :each do
    @label1 = Label.new(10, 'Title 1', 'Blue')
  end

  context 'tests the constructor method' do
    it 'New label should be instance of Label' do
      expect(@label1).to be_instance_of Label
    end
  end

  context 'tests the id method' do
    it 'should return id' do
      expect(@label1.id).to eq 10
    end
  end
end
