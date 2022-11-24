require_relative '../model/music_album'

describe MusicAlbum do
  describe '#can_be_archived?' do
    it 'returns false if the item is not on spotify' do
      music_album = MusicAlbum.new('2019-01-01', false, false)
      expect(music_album.can_be_archived?).to eq(false)
    end

    it 'returns true if the item is on spotify' do
      music_album = MusicAlbum.new('2019-01-01', true, false)
      expect(music_album.can_be_archived?).to eq(false)
    end
  end
end
