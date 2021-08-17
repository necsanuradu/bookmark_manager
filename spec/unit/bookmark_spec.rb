require './lib/bookmark.rb'

describe Bookmark do

  list = ["Red", "Green", "Blue"]
  it "has method all" do
    expect(subject).to respond_to(:all)
  end

  it "returns a list of bookmarks  with the length of 3" do 
    subject = described_class.new(list)
    expect(subject.all.count).to eq(3)
  end

  it "connection to database is live" do
    database_name = "bookmark_manager"
    error = 'database "' << database_name << '" does not exist'
    expect{ subject.db_connect(database_name) }.not_to raise_error{ error }
  end

  it "" do

  end

end


