describe UsersController do
  before { login_user(current_user) }

  describe "GET index" do
    context "when the current user is an admin" do
      let!(:current_user) { User.create!(admin: true, approval_at: Time.now) }

      it "assigns @users" do
        get :index
        expect(assigns(:users)).to eq([current_user])
      end

      it "renders the index template" do
        get :index
        expect(response).to render_template("index")
      end
    end

    context "when the current user is not an admin" do
      let!(:current_user) { User.create!(admin: false, approval_at: Time.now) }

      it "raises a 404 error" do
        expect { get :index }.to raise_error(ActionController::RoutingError, "Not Found")
      end
    end
  end

  describe "GET /users/:id/approve" do
    context "when the current user is an admin" do
      let!(:current_user) { User.create!(admin: true, approval_at: Time.now) }

      context "given an unapproved user" do
        let(:unapproved_user) { User.create! }

        it "approves the given user" do
          expect(unapproved_user.approved?).to be false
          get :approve, id: unapproved_user.id

          expect(unapproved_user.reload.approved?).to be true
        end

        it "renders the index template" do
          get :approve, id: unapproved_user.id
          expect(response).to redirect_to([:users])
        end
      end
    end

    context "when the current user is not an admin" do
      let!(:current_user) { User.create!(admin: false, approval_at: Time.now) }

      it "raises a 404 error" do
        expect { get :approve, id: 1 }.to raise_error(ActionController::RoutingError, "Not Found")
      end
    end
  end
end
