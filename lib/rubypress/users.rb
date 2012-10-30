module Rubypress
  module Users
    
    #http://codex.wordpress.org/XML-RPC_WordPress_API/Users#wp.getUsersBlogs
    def get_users_blogs(options = {})
      opts = {
        :blog_id  => 0,
        :username => self.username,
        :password => self.password
      }.merge(options)
      self.connection.call(
        "wp.getUsersBlogs", 
        opts[:username],
        opts[:password]
      )
    end
    
  end
end