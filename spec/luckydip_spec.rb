require_relative "../luckydip"

describe LuckyDip, 'test user interface and functionality' do
  luckydip = LuckyDip.new #new object
  context 'Respond to methods and object' do
    it 'Creates new Bank object' do
      expect(luckydip).to be_instance_of LuckyDip
    end
  end
end