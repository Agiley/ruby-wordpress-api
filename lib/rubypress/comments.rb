module Rubypress
  module Comments
    
    #http://codex.wordpress.org/XML-RPC_WordPress_API/Comments#wp.getComments
    def get_comments(options = {})
      opts = {
        :blog_id    =>  0,
        :username   =>  self.username,
        :password   =>  self.password,
        :post_id    =>  '',
        :status     =>  '',
        :number     =>  0,
        :offset     =>  0,
      }.merge(options)
      
      self.connection.call(
        "wp.getComments", 
        opts[:blog_id], 
        opts[:username],
        opts[:password],
        {
          :post_id    =>  opts[:post_id], 
          :status     =>  opts[:status],
          :number     =>  opts[:number],
          :offset     =>  opts[:offset]
        }
      )
    end
    
    #http://codex.wordpress.org/XML-RPC_WordPress_API/Comments#wp.deleteComment
    def delete_comment(options = {})
      opts = {
        :blog_id          => 0,
        :username         => self.username,
        :password         => self.password,
        :comment_id       => 0
      }.merge(options)
      
      self.connection.call(
        "wp.deleteComment", 
        opts[:blog_id],
        opts[:username],
        opts[:password],
        opts[:comment_id]
      )
    end
    
  end
end