require_relative '../model/game'

describe Game do
  before :each do
    @cj = Game.new(1, '2010-10-10', true, '2010-10-10')
    @near_for_speed = Game.new(2, '2010-10-10', false, '2010-10-10')
  end

  context 'New Game should be created' do
    it 'New Game should be Instance of Game' do
      expect(@cj).to be_instance_of Game
      expect(@near_for_speed).to be_instance_of Game
    end

    it 'Names should be classof String' do
      expect(@cj.publish_date).to be_kind_of String
      expect(@near_for_speed.last_played_at).to be_kind_of String
    end
  end

  context 'Valid arguments Should be passed' do
    it 'should return string id' do
      game = Game.new(1, '2010-10-10', true, '2010-10-10')
      expect(game.id).to eq 1
    end

    it 'should return PublishedDate' do
      game = Game.new(1, '2010-10-10', true, '2010-10-10')
      expect(game.publish_date).to eq '2010-10-10'
    end

    it 'should return last player at' do
      game = Game.new(1, '2010-10-10', true, '2010-10-10')
      expect(game.last_played_at).to eq '2010-10-10'
    end
  end
end
