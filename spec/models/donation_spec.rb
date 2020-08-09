describe Donation do
  subject { described_class.create }

  describe '.method_select_options' do
    it 'returns donation method options' do
      expect(described_class.method_select_options).to eq(
        [
          ['Credit card', 'credit_card'],
          ['Cash', 'cash'],
          ['Payment app', 'payment_app'],
          ['Other', 'other'],
        ]
      )
    end
  end
end
