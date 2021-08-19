require './lib/bookmark.rb'
require './spec/web_helpers.rb'

describe Bookmark do

  let(:list){ get_test_grid_bookmark_manager_test_db }

  it "has method all" do
    expect(subject).to respond_to(:all)
  end

  it "returns a list of bookmarks  with the length of 3" do 
    subject = described_class.new(list)
    expect(subject.all).to eq(list)
  end

  it "expects the connection to database to be live" do
    database_name = "bookmark_manager"
    error = 'database "' << database_name << '" does not exist'
    expect{ subject.db_connect(database_name) }.not_to raise_error{ error }
  end

  it "expects the values in the list to be found in the table SELECT query response" do
    active_bookmarks = subject.all("url")
    
    list.each do |url|
      expect(active_bookmarks.any? { |row| row.url == url } ).to eq(true)
    end
  end

  it 'saves a bookmark to the database' do
    new_url = 'https://www.facebook.com'
    subject.create(new_url)
    active_bookmarks = subject.all("url")
    expect(active_bookmarks.any? { |row| row.url == new_url }).to eq(true)
  end
end
