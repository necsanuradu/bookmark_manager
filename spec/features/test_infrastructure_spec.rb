feature 'test infrastructure' do
  scenario 'loads as expected' do
    visit('/')
    expect(page).to have_content('makers')
  end
end