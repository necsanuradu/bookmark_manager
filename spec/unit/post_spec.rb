require "./lib/post.rb"

describe Post do
  let(:row){ {"title" => "doregex", "url" => "https://doregex.com", "id" => 1} }

  it "will create an object for each row based on the query response received from the database" do 
    subject = described_class.new(row)
    expect(subject.title).to eq("doregex")
    expect(subject.url).to eq("https://doregex.com")
    expect(subject.id).to eq(1)
  end

end
