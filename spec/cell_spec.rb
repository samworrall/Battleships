require 'cell'

describe Cell do
  let(:subject) { Cell.new(ocean) }
  let(:ocean) { spy :ocean }

  describe '#content', :content do
    it 'Returns ocean upon initialisation' do
      expect(subject.content).to eq(ocean)
    end
  end

  describe '#hit?', :cell_hit? do
    it 'Returns false on initialisation' do
      expect(subject.hit?).to eq(false)
    end
  end

  describe '#take_hit', :cell_take_hit do
    it 'Changes hit? to true' do
      subject.take_hit
      expect(subject.hit?).to eq(true)
    end

    it 'Calls take_hit on cell content' do
      subject.take_hit
      expect(subject.content).to have_received(:take_hit).once
    end
  end
end
