module Rubypress
  module Users
    
    #http://codex.wordpress.org/XML-RPC_WordPress_API/Users#wp.getUsersBlogs
    def get_users_blogs(options = {})
      opts = {
        :username => self.username,
        :password => self.password
      }.merge(options)
      
      self.connection.call(
        "wp.getUsersBlogs", 
        opts[:username],
        opts[:password]
      )
    end
    
    #http://codex.wordpress.org/XML-RPC_WordPress_API/Users#wp.getUser
    def get_user(options = {})
      opts = {
        :blog_id    =>  0,
        :username   =>  self.username,
        :password   =>  self.password,
        :user_id    =>  0,
        :fields     =>  []
      }.merge(options)
      
      args = [
        opts[:blog_id],
        opts[:username],
        opts[:password],
        opts[:user_id]
      ]
      
      args << opts[:fields] unless (opts[:fields].nil? || opts[:fields].empty?)
      
      self.connection.call("wp.getUser", args)
    end
    
    #http://codex.wordpress.org/XML-RPC_WordPress_API/Users#wp.getUsers
    def get_users(options = {})
      opts = {
        :blog_id    =>  0,
        :username   =>  self.username,
        :password   =>  self.password,
        :filter     =>  {},
        :fields     =>  []
      }.merge(options)
      
      args = [
        opts[:blog_id],
        opts[:username],
        opts[:password]
      ]
      
      args << opts[:filter] unless (opts[:filter].nil? || opts[:filter].empty?)
      args << opts[:fields] unless (opts[:fields].nil? || opts[:fields].empty?)
      
      self.connection.call("wp.getUsers", args)
    end
    
    #Not yet available
    #http://codex.wordpress.org/XML-RPC_WordPress_API/Users#wp.editProfile
    def edit_profile(options = {})
      opts = {
        :blog_id  =>  0,
        :username =>  self.username,
        :password =>  self.password,
        :options  =>  {}
      }.merge(options)
      
      self.connection.call(
        "wp.editProfile", 
        opts[:blog_id], 
        opts[:username],
        opts[:password],
        opts[:options]
      )
    end
    
  end
end