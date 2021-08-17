require './lib/bookmark.rb'

describe Bookmark do

  let(:list){ ["http://www.makersacademy.com/", "http://www.google.com/", "http://www.destroyallsoftware.com"] }

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
      expect(active_bookmarks).to include(url)
    end
  end

end


