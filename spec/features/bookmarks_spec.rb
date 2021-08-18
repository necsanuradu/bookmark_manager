require './spec/web_helpers.rb'
require './lib/bookmark.rb'

feature Bookmark do
  let(:list){ get_test_grid_bookmark_manager_test_db }

  scenario "load the bookmarks page as expected" do 
    visit('/bookmarks')
    expect(page).to have_title("Bookmarks")
  end

  scenario "all 3 list initial urls should be present on the page" do 
    visit('/bookmarks')

    list.each do |value|
      expect(page.html).to include(value)
    end
  end

  scenario "check we can navigate to the create bookmark page" do
    visit("/bookmarks")
    # find("//a[name='add_bookmark']").click
    click_link('Add bookmark')
    expect(page).to have_title("Create Bookmark")
  end
  
end
