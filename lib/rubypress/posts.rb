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
        :post_id          => nil,
        :content          =>  {
          :post_author      =>  1,
          :post_type        =>  'post',
          :post_status      =>  'publish',
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
        :post_id          => nil
      }.merge(options)
      self.connection.call(
        "wp.deletePost", 
        opts[:blog_id],
        opts[:username],
        opts[:password],
        opts[:post_id]
      )
    end
    
    #http://codex.wordpress.org/XML-RPC_WordPress_API/Posts#wp.getPost
    def get_post(options = {})
      opts    =   {
        :blog_id              =>  0,
        :username             =>  self.username,
        :password             =>  self.password,
        :post_id              =>  nil
        :default_post_fields  =>  self.default_post_fields
      }.merge(options) 
      
      self.connection.call(
        "wp.getPost", 
        opts[:blog_id], 
        opts[:username],
        opts[:password],
        opts[:post_id],
        opts[:default_post_fields]
      )
    end
    
    #http://codex.wordpress.org/XML-RPC_WordPress_API/Posts#wp.getPosts
    def get_posts(options = {})
      opts    =   {
        :blog_id      =>  0,
        :username     =>  self.username,
        :password     =>  self.password,
        :post_type    =>  'post',
        :post_status  =>  '',
        :number       =>  0,
        :offset       =>  0,
        :orderby      =>  'post_id',
        :order        =>  'asc',
        :search       =>  nil,
        :default_post_fields => self.default_post_fields
      }.merge(options)
      
      filter  =   {
        :post_type    =>  opts[:post_type], 
        :post_status  =>  opts[:post_status],
        :number       =>  opts[:number],
        :offset       =>  opts[:offset],
        :orderby      =>  opts[:orderby],
        :order        =>  opts[:order],
      }
      
      filter.merge!(:s => opts[:search]) if (opts[:search] && !opts[:search].empty?)
      
      fields  =  opts[:default_post_fields]
      
      self.connection.call(
        "wp.getPosts", 
        opts[:blog_id], 
        opts[:username],
        opts[:password],
        filter,
        fields
      )
    end
    
    def recent_posts(options = {})
      return get_posts({:number => 10,
                        :offset => 0,
                        :orderby => 'post_date',
                        :order => 'asc'})
    end
    
  end
end