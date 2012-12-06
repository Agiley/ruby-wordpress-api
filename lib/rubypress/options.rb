module Rubypress
  module Options
    
    #http://codex.wordpress.org/XML-RPC_WordPress_API/Options#wp.getOptions
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
    
    #http://codex.wordpress.org/XML-RPC_WordPress_API/Options#wp.setOptions
    def set_options(options = {})
      opts = {
        :blog_id => 0,
        :username => self.username,
        :password => self.password,
        :options => {}
      }.merge(options)
      
      self.connection.call(
        "wp.setOptions", 
        opts[:blog_id], 
        opts[:username],
        opts[:password],
        opts[:options]
      )
    end
    
  end
end