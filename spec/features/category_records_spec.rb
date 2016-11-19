feature "Category record creation" do
  context "when a user visits a recipient show page" do
    let!(:user) { login_new_user }
    let!(:recipient) { Recipient.create!(name: "Test Recipient") }

    before { visit polymorphic_path(recipient) }

    context "and clicks the new category link" do
      before { click_link I18n.t("recipients.show.new_category_link") }

      context "and no recipients have been categorized yet" do
        it "does not show the existing categories section" do
          expect(page).to_not have_content("Existing Categories")
        end
      end

      context "and a categorized recipient exists" do
        let!(:category_record) { CategoryRecord.create!(recipient: recipient, category: "Test Category") }

        before { visit current_path }

        it "shows the existing categories section" do
          expect(page).to have_content(I18n.t("category_records.form.existing_categories"))
        end
      end

      context "and the user fills out and submits the form" do
        before do
          fill_in "category_record_category", with: "Test Category"
          click_button I18n.t("helpers.submit.create", model: CategoryRecord.model_name.human)
        end

        it "adds a new category record to the recipient" do
          expect(recipient.reload.category_records.count).to eq 1
        end
      end
    end
  end
end
