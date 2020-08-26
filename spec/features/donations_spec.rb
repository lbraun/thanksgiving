feature "donation show page" do
  context "when a user visits a donation show page" do
    let!(:current_user) { login_new_user }

    subject!(:donation) do
      Donation.create!(
        amount: 1234,
        date: Date.parse("2000-01-01"),
        recipient: Recipient.create!(name: "Test Recipient"),
        status: "planned",
        user: user,
      )
    end

    let(:show_path) { polymorphic_path(subject) }

    context "and the donation was not made by the current user" do
      let(:user) { User.create! }

      it "returns a 404 not found page" do
        expect { visit show_path }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context "and the donation was made by the current user" do
      let(:user) { current_user }

      it "shows the status of the donation" do
        visit show_path
        expect(page).to have_content "Planned"
      end
    end
  end
end

feature "donation index page" do
  context "when a user visits the primary donation index" do
    let!(:current_user) { login_new_user }

    let(:index_path) { polymorphic_path(:donations) }
    let(:no_records_message) { I18n.t("defaults.no_records", records: "donations") }
    let(:title) { I18n.t("donations.index.title") }

    let!(:donation) do
      Donation.create!(
        amount: 1234,
        date: Date.today,
        recipient: Recipient.create!(name: "Test Recipient"),
        status: "planned",
        user: user,
      )
    end

    let(:user) { current_user }

    before { visit index_path }

    it "shows the correct header" do
      expect(find("h1")).to have_content title
    end

    context "and no donations exist for the current user" do
      let(:user) { User.create! }

      it "shows an appropriate message" do
        expect(page).to_not have_content "$1,234.00"
        expect(page).to have_content no_records_message
      end
    end
  end

  context "when a user visits the donation index page for the year 2000" do
    let!(:current_user) { login_new_user }

    let(:year_2000_index_path) { polymorphic_path(:donations, year: 2000) }
    let(:no_records_message) { I18n.t("defaults.no_records", records: "donations") }

    let!(:donation) do
      Donation.create!(
        amount: 1234,
        date: Date.parse("#{donation_year}-01-01"),
        recipient: Recipient.create!(name: "Test Recipient"),
        status: "planned",
        user: user,
      )
    end

    let(:user) { current_user }

    before { visit year_2000_index_path }

    context "and no donations exist for the year 2000" do
      let(:donation_year) { 2001 }

      it "shows an appropriate message" do
        expect(find("#donations_table_container")).to have_content no_records_message
      end
    end

    context "and a donation exists for the year 2000" do
      let(:donation_year) { 2000 }

      context "but it does not belong to the current user" do
        let(:user) { User.create! }

        it "shows an appropriate message" do
          expect(find("#donations_table_container")).to have_content no_records_message
        end
      end

      context "and it belongs to the current user" do
        let(:user) { current_user }

        it "shows the right labels in the header of the table" do
          header_labels = "Date Recipient Amount Status"
          expect(find("thead > tr:nth-child(1)").text).to eq header_labels
        end

        it "shows information about the donation in the first row of the table" do
          donation_information = "January 01, 2000 Test Recipient $1,234.00 planned Show Edit Destroy"
          expect(find("tbody > tr:nth-child(1)").text).to eq donation_information
        end
      end
    end
  end
end

feature "Donation creation" do
  context "when a user visits the donation index page" do
    let!(:user) { login_new_user }

    before { visit polymorphic_path(:donations) }

    context "and clicks the new donation link" do
      before { click_link I18n.t("defaults.new_link", model: Donation) }

      context "and a recipient exists" do
        let!(:recipient) { Recipient.create!(name: "Test Recipient") }

        before { visit current_path }

        it "shows the right label for the new recipient button" do
          new_recipient_button_label = "Add new recipient"
          expect(find("a.button.warning.right").text).to eq new_recipient_button_label
        end

        context "and the user fills out and submits the form" do
          before do
            fill_in "donation_amount", with: "$100.00"
            select recipient.name, from: "donation_recipient_id"
            fill_in "donation_date", with: "2000-01-01"
            select "Cash", from: "donation_method"
            select "Planned", from: "donation_status"
            click_button I18n.t("helpers.submit.create", model: Donation)
          end

          it "creates a new donation with the correct attributes" do
            expect(page).to have_content "Donation was successfully recorded."
            expect(Donation.count).to eq 1
            donation = Donation.first
            expect(donation.amount).to eq 100
            expect(donation.date).to eq Date.parse("2000-01-01")
            expect(donation.method).to eq "cash"
            expect(donation.status).to eq "planned"
          end
        end
      end

      context "and no recipients exist" do

      end
    end
  end
end
