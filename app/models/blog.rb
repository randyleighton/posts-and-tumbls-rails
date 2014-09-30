class Blog

  attr_reader :title, :caption, :body

  def initialize(params)
    @title = params["title"]
    @caption = params["caption"]
    @body = params["body"]
  end

  def self.all
    blogs = []
    client = Tumblr::Client.new
    response = client.posts("houseofsoundpdx.tumblr.com")
    response["posts"].each do |blog_attributes|
      blogs << Blog.new(blog_attributes)
    end
    blogs
  end



end
