require 'ocean'

describe Ocean do
  describe '#hit', :hit do
    it 'Returns false upon initialisation' do
      expect(subject.hit).to eq(false)
    end
  end
end
