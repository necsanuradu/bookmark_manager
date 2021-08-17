feature 'test infrastructure' do
  scenario 'loads root page as expected' do
    visit('/')
    expect(page).to have_title('BookmarkManager')
  end
end
