feature "recipient show page" do
  context "when a user visits a recipient show page" do
    let!(:current_user) { login_new_user }

    subject!(:recipient) do
      Recipient.create!(name: "Test Recipient", url: "http://example.com/")
    end

    let(:show_path) { polymorphic_path(subject) }
    before { visit show_path }

    it "displays basic information about the recipient" do
      expect(page).to have_content("Name: Test Recipient")
      expect(page).to have_content("URL: http://example.com/")
    end

    context "and the recipient has not recieved any donations" do
      it "shows an appropriate message" do
        expect(page).to have_content I18n.t("defaults.no_records", records: "donations")
      end
    end

    context "and the recipient has recieved donations" do
      let!(:donation) do
        Donation.create!(
          amount: 1,
          date: Date.parse("2000-01-01"),
          recipient: subject,
          status: "planned",
          user: donor,
        )
      end

      before { visit show_path }

      context "and the donor was the current user" do
        let(:donor) { current_user }

        it "lists the donations in a table" do
          within("#donations_table") do
            expect(page).to have_content("$1")
          end
        end
      end

      context "and the donor was not the current user" do
        let(:donor) { User.new }

        it "shows an appropriate message" do
          expect(page).to have_content I18n.t("defaults.no_records", records: "donations")
        end
      end
    end
  end
end

feature "recipient index page" do
  context "when a user visits the recipients index" do
    let!(:current_user) { login_new_user }

    let(:index_path) { polymorphic_path(:recipients) }
    let(:no_records_message) { I18n.t("defaults.no_records", records: "recipients") }

    context "and no recipients exist" do
      it "shows an appropriate message" do
        visit index_path
        expect(page).to have_content no_records_message
      end
    end

    context "and a recipient exists" do
      let!(:recipient) do
        Recipient.create!(name: "A Test Recipient")
      end

      before { visit index_path }

      it "lists the recipient in a table" do
        expect(find("#recipients_table")).to have_content("A Test Recipient")
      end

      context "and the recipient is destroyable" do
        it "shows a link to destroy the recipient" do
          expect(find("#recipients_table")).to have_link(I18n.t("defaults.destroy_link"))
        end
      end

      context "and the recipient is not destroyable" do
        let!(:donation) do
          Donation.create!(
            amount: 1,
            date: Date.parse("2000-01-01"),
            recipient: recipient,
            status: "planned",
            user: current_user,
          )
        end

        before { visit index_path }

        it "does not show a link to destroy the recipient" do
          expect(find("#recipients_table")).to_not have_link(I18n.t("defaults.destroy_link"))
        end
      end
    end
  end
end

feature "recipient create page" do
  context "when a user visits the recipient index page" do
    let!(:user) { login_new_user }

    before { visit polymorphic_path(:recipients) }

    context "and clicks the new recipient link" do
      before { click_link I18n.t("defaults.new_link", model: Recipient) }

      context "and the user fills out and submits the form" do
        before do
          fill_in "recipient_name", with: "Test Institution"
          click_button I18n.t("helpers.submit.create", model: Recipient)
        end

        it "creates a new recipient with the correct attributes" do
          expect(page).to have_content "Recipient was successfully created."
          expect(Recipient.count).to eq 1
          recipient = Recipient.first
          expect(recipient.name).to eq "Test Institution"
        end
      end
    end
  end
end
