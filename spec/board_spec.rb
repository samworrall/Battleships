require 'board'

describe Board do
  describe '#grid', :grid do
    it 'Returns an empty hash upon initialisation' do
      expect(subject.grid).to eq({})
      expect(subject.grid).to be_empty
    end
  end
end
