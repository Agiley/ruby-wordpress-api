# encoding: UTF-8

module Rubypress

  class Client
    attr_reader :connection
    attr_accessor :port, :host, :path, :username, :password, :use_ssl, :default_post_fields

    def initialize(options = {})
      opts = {
        :host                 =>  nil,
        :port                 =>  80,
        :use_ssl              =>  true,
        :path                 =>  '/xmlrpc.php',
        :username             =>  nil,
        :password             =>  nil,
        :default_post_fields  =>  ['post','terms','custom_fields']
      }.merge(options)
      
      self.host                 =   opts[:host]
      self.port                 =   opts[:port]
      self.path                 =   opts[:path]
      self.username             =   opts[:username]
      self.password             =   opts[:password]
      self.use_ssl              =   opts[:use_ssl]
      self.default_post_fields  =   opts[:default_post_fields]
      self.connect
      
      self
    end

    def connect
      @connection = XMLRPC::Client.new(self.host, self.path, self.port, nil, nil, nil, nil, self.use_ssl, nil)
    end

    def get_options(options = {})
      opts = {
        :blog_id => 0,
        :username => self.username,
        :password => self.password,
        :options => []
      }.merge(options)
      self.connection.call(
        "wp.getOptions", 
        opts[:blog_id], 
        opts[:username],
        opts[:password],
        opts[:options]
      )
    end
    
    def get_users_blogs(options = {})
      opts = {
        :blog_id => 0,
        :username => self.username,
        :password => self.password,
        :options => []
      }.merge(options)
      self.connection.call(
        "wp.getUsersBlogs", 
        opts[:username],
        opts[:password]
      )
    end    

    def recent_posts(options = {})
      opts = {
        :blog_id => 0,
        :username => self.username,
        :password => self.password,
        :post_type => 'post',
        :post_status => 'publish',
        :number => 10,
        :offset => 0,
        :orderby => 'post_date',
        :order => 'asc',
        :default_post_fields => self.default_post_fields
      }.merge(options)
      self.connection.call(
        "wp.getPosts", 
        opts[:blog_id], 
        opts[:username],
        opts[:password],
        {
          :post_type => opts[:post_type], 
          :post_status => opts[:post_status],
          :number => opts[:number],
          :offset => opts[:offset],
          :orderby => opts[:orderby],
          :order => opts[:order]
        },
        opts[:default_post_fields]
      )
    end
    
    #http://codex.wordpress.org/XML-RPC_WordPress_API/Posts#wp.newPost
    def new_post(options = {})
      opts = {
        :blog_id          => 0,
        :username         => self.username,
        :password         => self.password,
        :content          =>  {
          :post_author      =>  1,
          :post_type        =>  'post',
          :post_status      =>  'publish',
          :post_title       =>  'New WordPress Post',
          :post_name        =>  'new-wordpress-post-permalink',
          :post_content     =>  "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
          :comment_status   =>  'open',
          :ping_status      =>  'open',
          :terms            =>  ['category' => 1]
        }
      }.merge(options)
      self.connection.call(
        "wp.newPost", 
        opts[:blog_id],
        opts[:username],
        opts[:password],
        opts[:content]
      )
    end

  end

end
