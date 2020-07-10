require './bin/main'

describe 'main script:' do
  # describe '#get_name' do
  #   it 'returns player name' do
  #     expect(get_name('luc')).to eql('luc')
  #   end
  # end
end

describe Player do
  subject {Player.new('luc', 'X')}
  
end