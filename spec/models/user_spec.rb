describe User do
  subject { described_class.create }

  describe '#approve' do
    context 'when a user is not yet approved' do
      it 'approves them' do
        expect { subject.approve }.to change { subject.approved? }.from(false).to(true)
      end
    end
  end

  describe '#remove_approval' do
    context 'when a user is approved' do
      before { subject.approval_at = Time.now }

      it 'removes their approval' do
        expect { subject.remove_approval }.to change { subject.approved? }.from(true).to(false)
      end
    end
  end

  describe '#approved?' do
    context 'when a user is approved' do
      before { subject.approval_at = Time.now }

      it 'returns true' do
        expect(subject.approved?).to be true
      end
    end

    context 'when a user is not approved' do
      before { subject.approval_at = nil }

      it 'returns true' do
        expect(subject.approved?).to be false
      end
    end
  end

  describe '#admin?' do
    context 'when a user is an admin' do
      before { subject.admin = true }

      it 'returns true' do
        expect(subject.admin?).to be true
      end
    end

    context 'when a user is not an admin' do
      before { subject.admin = false }

      it 'returns true' do
        expect(subject.admin?).to be false
      end
    end
  end
end
