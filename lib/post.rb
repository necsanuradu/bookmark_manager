class Post
  attr_reader :title, :url, :id

  def initialize(row)
    @title = row['title']
    @url = row['url']
    @id = row['id']
  end

end
