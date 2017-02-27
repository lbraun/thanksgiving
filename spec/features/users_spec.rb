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

    it "sees a table with proper headers and rows" do
      expect(page).to have_css("#user_#{admin.id}", :text => "#{admin.name}")
      expect(page).to have_css("#user_#{admin.id}", :text => "#{admin.created_at_string}")
      expect(page).to have_css("#user_#{admin.id}", :text => "#{admin.approval_at_string}")
      expect(page).to have_css("#user_#{admin.id}", :text => "Delete")
      expect(page).to have_css("#user_#{admin.id}", :text => "Yes")
      expect(page).to_not have_css("#user_#{admin.id}", :text => "No")
    end

    it "sees a table with proper headers and rows" do
      expect(page).to have_css("#user_#{users.first.id}", :text => "#{users.first.name}")
      expect(page).to have_css("#user_#{users.first.id}", :text => "#{users.first.created_at_string}")
      expect(page).to have_css("#user_#{users.first.id}", :text => "#{users.first.approval_at_string}")
      expect(page).to have_link('Yes', :href => remove_approval_user_path(users.first.id))
      expect(page).to_not have_link('No', :href => approve_user_path(users.first.id))
      expect(page).to have_link('No', :href => toggle_admin_user_path(users.first.id))
      expect(page).to_not have_link('Yes', :href => toggle_admin_user_path(users.first.id))
    end

    context "the admin clicks Yes for user approval" do
      before do
        find(:xpath, "//a[@href='/users/#{unapproved_user.id}/approve']").click
      end

      it "approves the user" do
        expect(unapproved_user.reload).to be_approved
      end

      it "displays an approval time" do
        expect(page).to have_content(unapproved_user.approval_at_string)
      end

      it "no longer shows the approve link" do
        expect(page).to have_link('Yes', :href => remove_approval_user_path(unapproved_user))
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
