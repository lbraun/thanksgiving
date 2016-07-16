describe 'users/index' do
  it 'displays all the users' do
    assign(:users, [
      User.create!(name: 'slicer'),
      User.create!(name: 'dicer')
    ])

    render

    expect(rendered).to match /slicer/
    expect(rendered).to match /dicer/
  end
end
