module Rubypress
  module Options
    
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
    
  end
end