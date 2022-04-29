require_relative "../luckydip"

describe LuckyDip, 'test user interface and functionality' do
  luckydip = LuckyDip.new #new object
  context 'Respond to methods and object' do
    it 'Creates new Bank object' do
      expect(luckydip).to be_instance_of LuckyDip
    end

    it 'Check if input exist' do
      expect(luckydip).to respond_to(:input)
    end

    it 'SET FOR LIFE to match the game numbers' do
      expect(luckydip.instance_variable_get(:@life)).to eq(Array(1..47))
    end

    it 'EUROMILLIONS to match the game numbers' do
      expect(luckydip.instance_variable_get(:@euro)).to eq(Array(1..50))
    end

  end
end