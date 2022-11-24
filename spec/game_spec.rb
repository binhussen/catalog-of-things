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
      expect(@near_for_speed.last_played_at).to be_kind_of String
    end
  end

  context 'Valid arguments Should be passed' do
    it 'should return Multiplayer' do
      game = Game.new(1, '2010-10-10', true, '2010-10-10')
      expect(game.multiplayer).to eq true
    end

    it 'should return last played at' do
      game = Game.new(1, '2010-10-10', true, '2010-10-10')
      expect(game.last_played_at).to eq '2010-10-10'
    end
  end
end
