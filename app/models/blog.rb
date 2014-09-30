class Blog

  attr_reader :title

  def initialize(params)
    @title = params["title"]
  end

  def self.all
    blogs = []
    client = Tumblr::Client.new
    response = client.posts("randyleighton.tumblr.com")
    response["posts"].each do |blog_attributes|
      blogs << Blog.new(blog_attributes)
    end
    blogs
  end



end
