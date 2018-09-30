require 'ocean'

describe Ocean do
  describe '#hit', :hit do
    it 'Returns false upon initialisation' do
      expect(subject.hit).to eq(false)
    end
  end

  describe '#take_hit', :take_hit do
    it 'Changes the hit attribute from false to true' do
      expect { subject.take_hit }.to change { subject.hit }.from(false).to(true)
    end
  end

  describe '#hit?', :hit? do
    it 'Returns false upon initialisation' do
      expect(subject.hit?).to eq(false)
    end

    it 'Returns true after take_hit method' do
      subject.take_hit
      expect(subject.hit?).to eq(true)
    end
  end
end
