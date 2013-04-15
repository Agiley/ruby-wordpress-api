module Rubypress
  module Media
    
    #http://codex.wordpress.org/XML-RPC_WordPress_API/Media#wp.uploadFile
    def upload_file(options = {})
      opts = {
        :blog_id          => 0,
        :username         => self.username,
        :password         => self.password,
        :data             =>  {
          :name         =>  '',
          :type         =>  '',
          :bits         =>  '',
          :overwrite    =>  false
        }
      }.merge(options)
      
      opts[:data][:bits] = XMLRPC::Base64.new(opts[:data][:bits])
      
      self.connection.call(
        "wp.uploadFile", 
        opts[:blog_id],
        opts[:username],
        opts[:password],
        opts[:data]
      )
    end
    
  end
end