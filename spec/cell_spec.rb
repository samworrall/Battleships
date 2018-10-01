require 'cell'

describe Cell do
  let(:subject) { Cell.new(ocean) }
  let(:ocean) { double :ocean }

  describe '#content', :content do
    it 'Returns ocean upon initialisation' do
      expect(subject.content).to eq(ocean)
    end
  end
end
