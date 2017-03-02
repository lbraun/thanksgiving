feature "user management" do
  let(:users_index_path) { polymorphic_path([:users]) }

  context "when an admin visits the users index" do
    let!(:admin) { login_new_admin_user }
    let!(:users) { create_list(:user, 2) }
    let!(:unapproved_user) { create(:user, approval_at: nil)}

    before { visit users_index_path }

    it "displays a table of users" do
      expect(page).to have_table("users_table")
    end

    it "sees a table with proper headers and admin row data" do
      page.find("#user_#{admin.id} td:nth-of-type(1)", text: admin.name)
      page.find("#user_#{admin.id} td:nth-of-type(2)", text: admin.created_at_string)
      page.find("#user_#{admin.id} td:nth-of-type(3)", text: "Yes")
      page.find("#user_#{admin.id} td:nth-of-type(4)", text: admin.approval_at_string)
      page.find("#user_#{admin.id} td:nth-of-type(5)", text: "Yes")
      page.find("#user_#{admin.id} td:nth-of-type(6)", text: "Delete")
    end

    it "sees a table with proper headers and user row data" do
      page.find("#user_#{users.first.id} td:nth-of-type(1)", text: users.first.name)
      page.find("#user_#{users.first.id} td:nth-of-type(2)", text: users.first.created_at_string)
      page.find("#user_#{users.first.id} td:nth-of-type(3)", text: "Yes")
      page.find("#user_#{users.first.id} td:nth-of-type(4)", text: users.first.approval_at_string)
      page.find("#user_#{users.first.id} td:nth-of-type(5)", text: "No")
      page.find("#user_#{users.first.id} td:nth-of-type(6)", text: "Delete")
    end

    context "and admin clicks No for user approval" do
      before do
        find('.not-approved').click

      end

      it "approves the user" do
        expect(unapproved_user.reload).to be_approved
      end

      it "displays an approval time" do
        expect(page).to have_content(unapproved_user.approval_at_string)
      end

      it "shows Yes instead of No button" do
        expect(page).to have_link('Yes', href: remove_approval_user_path(unapproved_user))
      end

      context "and the admin clicks No for user approval for same user" do
        before do
          find(:xpath, "//a[@href='/users/#{unapproved_user.id}/remove_approval']").click
        end

        it "removes the user's approval" do
          expect(unapproved_user.reload).to_not be_approved
        end
      end

      context "and the admin clicks the delete link for same user" do
        before do
          within(:css, "#user_#{unapproved_user.id}") do
            click_link "Delete"
          end
        end

        it "deletes the user" do
          expect(User.find_by_id(unapproved_user.id)).to be_nil
        end
      end
    end
  end
end
