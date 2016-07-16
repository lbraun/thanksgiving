describe User do
  subject { described_class.create }

  describe '#approve' do
    context 'when a user is not yet approved' do
      it 'approves them' do
        expect { subject.approve }.to change { subject.approved? }.from(false).to(true)
      end
    end
  end
end
