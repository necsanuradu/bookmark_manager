feature "allows saving of bookmarks" do 

  scenario "loads up form to allow user to save bookmark" do 
    visit('/create_bookmark')
    expect(page).to have_title("Create Bookmark")
  end

  scenario "can submit a bookmark to be saved" do
    visit('/create_bookmark')
    fill_in('url', with: 'https://www.facebook.com/')
    click_button('submit')
    expect(page).to have_content('https://www.facebook.com/')
  end

end
