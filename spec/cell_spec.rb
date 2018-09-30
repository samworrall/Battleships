require 'cell'

describe Cell do
  describe '#content' do
    it 'Returns nil upon initialisation' do
      expect(subject.content).to eq(nil)
    end
  end
end
