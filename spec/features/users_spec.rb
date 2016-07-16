feature "User management" do
  let(:users_index_path) { polymorphic_path([:users]) }

  context "when an admin user visits the users index" do
    let!(:admin_user) { login_new_admin_user }
    subject { admin_user }

    before { visit users_index_path }

    it "displays a table of users" do
      expect(page).to have_table("users_table")
    end

    it "fills the table with the right headers and rows" do
      check_headers_and_values_on_generic_index_page(
        "users_table", {
          "Name" => "Example User",
          "Created At" => subject.created_at_string,
          "Approval At" => subject.approval_at_string,
          "Admin" => "true",
          "Actions" => "Approve",
        }
      )
    end

    context "and a new non-admin user is added" do
      subject! { User.create!(name: "Joe") }

      before { visit users_index_path }

      it "fills the table with that user\"s information too" do
        check_headers_and_values_on_generic_index_page(
          "users_table", {
            "Name" => "Joe",
            "Created At" => subject.created_at_string,
            "Approval At" => "",
            "Admin" => "",
            "Actions" => "Approve",
          }
        )
      end

      context "and the current user clicks the approve link for that user" do
        before do
          within(:row_for, subject) do
            click_link "Approve"
          end
        end

        it "approves the user" do
          within(:row_for, subject) do
            expect(find(:value_under_header, "Approval At").text).to include(Date.today.to_s(:long))
          end
        end
      end
    end
  end
end
