class Blog

  attr_reader :title, :caption, :body, :type, :image

  def initialize(params)
    @title = params["title"]
    @caption = params["caption"]
    @body = params["body"]
    @type = params["type"]
    @image = params["photos"][0]["original_size"]["url"] if params["photos"]
    @followers = params["follower"]
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

  # def self.get_followers
  #   followers = []
  #   client = Tumblr::Client.new
  #   response = client.followers("randyleighton.tumblr.com")
  # end
end
