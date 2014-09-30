class Blog

  attr_reader :title, :caption, :body, :type, :image

  def initialize(params)
    @title = params["title"]
    @caption = params["caption"]
    @body = params["body"]
    @type = params["type"]
    @image = params["photos"][0]["original_size"]["url"] if params["photos"]
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
