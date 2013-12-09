module Rubypress
  module Themes
    
    #Requires a custom implementation in a WordPress plugin or theme in order to work!
    def switch_theme(options = {})
      opts = {
        :blog_id    =>  0,
        :username   =>  self.username,
        :password   =>  self.password,
        :theme      =>  ''
      }.merge(options)
      
      self.connection.call(
        "themes.switchTheme", 
        opts[:blog_id], 
        opts[:username],
        opts[:password],
        opts[:theme]
      )
    end
    
  end
end