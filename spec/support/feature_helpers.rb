module FeatureHelpers
  def login_new_user(options = {})
    visit "/"
    within(".super-button") do
      click_link "Sign in or sign up"
    end
    user = User.last
    user.admin = options[:admin] || false
    user.approval_at = options[:approval_at] || Time.now
    user.save!
    visit "/"
    user
  end

  def login_new_admin_user
    login_new_user(admin: true)
  end

  def check_headers_and_values_on_generic_index_page(table_locator, headers_and_values_hash)
    within_table(table_locator) do
      within("thead") do
        headers_and_values_hash.keys.each_with_index do |header, i|
          expect(find(:header_at_index, i + 1)).to have_content(header)
        end
      end

      within(:row_for, headers_and_values_hash) do
        headers_and_values_hash.each do |header, value|
          expect({ header => find(:value_under_header, header).text }).to eq({ header => value })
        end
      end
    end
  end

  Capybara.add_selector(:header_at_index) do
    xpath { |index| ".//tr/th[#{index}]" }
  end

  Capybara.add_selector(:value_under_header) do
    xpath { |header| ".//td[(count(.//../../../thead/tr/th[.='#{header}']/preceding-sibling::*)+1)]" }
  end

  Capybara.add_selector(:row_for) do
    xpath { |object| ".//tr[@id='#{FeatureHelpers.dom_id(object)}']" }
  end

  def self.dom_id(object)
    ActionView::RecordIdentifier.dom_id(object)
  end
end
