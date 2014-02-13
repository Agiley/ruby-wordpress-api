module Rubypress
  module Custom
    
    def update_go_codes(options = {})
      opts = {
        :blog_id          => 0,
        :username         => self.username,
        :password         => self.password,
        :codes            => {}
      }.merge(options)
      
      self.connection.call(
        "wsc.updateGoCodes", 
        opts[:blog_id],
        opts[:username],
        opts[:password],
        opts[:codes]
      )
    end
    
  end
end