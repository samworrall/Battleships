require 'player'

describe Player do
  describe '#fleet', :fleet do
    it 'Returns an empty array upon initialisation' do
      expect(subject.fleet).to be_empty
      expect(subject.fleet).to eq([])
    end
  end
end
