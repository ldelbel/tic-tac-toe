require './lib/player.rb'

describe Player do
  let(:player) {Player.new('Ezekiel','X')}
  describe '#move' do
    it 'returns the value of the prompt input as a string' do
      allow(player).to receive(:gets).and_return('2')
      expect(player.move).to eql('2')
    end
  end

  describe '#increment_score' do
    it 'returns the value of the score incremented by 1' do
      expect(player.increment_score).to eql(1)
    end
  end
end