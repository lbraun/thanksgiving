describe Api::RecipientsController, type: :controller do
  before { login_user(current_user) }

  describe "GET index" do
    let!(:current_user) { User.create!(admin: false, approval_at: Time.now) }

    context 'when there are no recipients' do
      it "returns an empty array as json" do
        get :index
        expect(JSON.parse(response.body)).to eq([])
      end
    end

    context 'when there are three recipients' do
      let!(:recipient_1) { Recipient.create!(name: 'Recipient 1') }
      let!(:recipient_2) { Recipient.create!(name: 'Recipient 2') }
      let!(:recipient_3) { Recipient.create!(name: 'Recipient 3') }

      it "returns json of all the recipients" do
        get :index
        expect(JSON.parse(response.body).count).to eq(3)
        expect(JSON.parse(response.body)).to match([
          {'id' => recipient_1.id, 'name' => recipient_1.name},
          {'id' => recipient_2.id, 'name' => recipient_2.name},
          {'id' => recipient_3.id, 'name' => recipient_3.name},
        ])
      end
    end
  end
end
