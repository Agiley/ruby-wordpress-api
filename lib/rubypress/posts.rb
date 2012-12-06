module Rubypress
  module Posts
    
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
          :terms            =>  {'category' => [1]}
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
    
    #http://codex.wordpress.org/XML-RPC_WordPress_API/Posts#wp.editPost
    def edit_post(options = {})
      opts = {
        :blog_id          => 0,
        :username         => self.username,
        :password         => self.password,
        :post_id          => 1,
        :content          =>  {
          :post_author      =>  1,
          :post_type        =>  'post',
          :post_status      =>  'publish',
          :post_title       =>  'Edited WordPress Post',
          :post_name        =>  'edited-wordpress-post-permalink',
          :post_content     =>  "No more lorem ipsum!",
          :comment_status   =>  'open',
          :ping_status      =>  'open',
          :terms            =>  {'category' => [1]}
        }
      }.merge(options)
      self.connection.call(
        "wp.editPost", 
        opts[:blog_id],
        opts[:username],
        opts[:password],
        opts[:post_id],
        opts[:content]
      )
    end
    
    #http://codex.wordpress.org/XML-RPC_WordPress_API/Posts#wp.deletePost
    def delete_post(options = {})
      opts = {
        :blog_id          => 0,
        :username         => self.username,
        :password         => self.password,
        :post_id          => 1
      }.merge(options)
      self.connection.call(
        "wp.deletePost", 
        opts[:blog_id],
        opts[:username],
        opts[:password],
        opts[:post_id]
      )
    end
    
    def get_posts(options = {})
      opts = {
        :blog_id      =>  0,
        :username     =>  self.username,
        :password     =>  self.password,
        :post_type    =>  'post',
        :post_status  =>  '',
        :number       =>  0,
        :offset       =>  0,
        :orderby      =>  'post_id',
        :order        =>  'asc',
        :default_post_fields => self.default_post_fields
      }.merge(options)
      
      self.connection.call(
        "wp.getPosts", 
        opts[:blog_id], 
        opts[:username],
        opts[:password],
        {
          :post_type    =>  opts[:post_type], 
          :post_status  =>  opts[:post_status],
          :number       =>  opts[:number],
          :offset       =>  opts[:offset],
          :orderby      =>  opts[:orderby],
          :order        =>  opts[:order]
        },
        opts[:default_post_fields]
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
    
  end
end