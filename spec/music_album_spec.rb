require_relative '../model/music_album'

describe MusicAlbum do
  before :each do
    @album = MusicAlbum.new('2001-03-05', true, nil)
  end

  it 'can be moved to archive' do
    @album.move_to_archive
    expect(@album.archived).to be true
  end

  it 'checks published date' do
    expect(@album.publish_date).to eq('2001-03-05')
  end
end
