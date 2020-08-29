describe 'recipients/show' do
  it 'displays a recipient\'s attrubitues' do
    assign(:recipient,
      Recipient.new(
        id: 1,
        name: 'School',
        url: 'https://www.example.com',
        reasons_for_support: 'It\'s good',
      )
    )
    assign(:donations, [])

    render

    expect(rendered).to match /Reasons for support:/
    expect(rendered).to match /URL:/
    expect(rendered).to match /My giving history:/

    expect(rendered).to match /Back/
    expect(rendered).to match /Edit/
  end
end
