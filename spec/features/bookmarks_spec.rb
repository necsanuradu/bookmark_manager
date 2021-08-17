feature "test bookmarks list" do
  scenario "load the bookmarks page as expected" do 
    visit('/bookmarks')
    expect(page).to have_title("Bookmarks")
  end
end
