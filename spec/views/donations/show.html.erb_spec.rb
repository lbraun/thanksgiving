describe 'donations/show' do
  it 'displays a donation\'s attrubitues' do
    assign(:recipient,
      Recipient.new(
        id: 1,
        name: 'School',
        url: 'https://www.example.com',
        reasons_for_support: 'It\'s good',
      )
    )
    assign(:donation,
      Donation.new(
        id: 1,
        amount: 100,
        recipient_id: 1,
        date: '2020-08-26' ,
        method: 'payment_app',
        status: 'completed',
        user_id: 1,
      )
    )

    render

    expect(rendered).to match /Amount:/
    expect(rendered).to match /Recipient:/
    expect(rendered).to match /Date:/
    expect(rendered).to match /Method:/
    expect(rendered).to match /Status:/

    expect(rendered).to match /Back/
    expect(rendered).to match /Edit/
  end
end
