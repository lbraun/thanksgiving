module DonationsHelper
  def display_currency(amount)
    amount == 0 ? "-" : number_to_currency(amount)
  end
end
