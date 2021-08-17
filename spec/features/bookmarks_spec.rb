require './spec/web_helpers.rb'
require './lib/bookmark.rb'

feature Bookmark do
  let(:list){ reset_bookmark_manager_test_db }

  scenario "load the bookmarks page as expected" do 
    visit('/bookmarks')
    expect(page).to have_title("Bookmarks")
  end

  scenario "all 3 list initial urls should be present on the page" do 
    visit('/bookmarks')

    list.each do |value|
      expect(page).to have_content(value)
    end
  end
  
end
