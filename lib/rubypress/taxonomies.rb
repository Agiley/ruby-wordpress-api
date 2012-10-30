module Rubypress
  module Taxonomies
    
    #http://codex.wordpress.org/XML-RPC_WordPress_API/Taxonomies#wp.getTaxonomies
    def get_taxonomies(options = {})
      opts = {
        :blog_id => 0,
        :username => self.username,
        :password => self.password
      }.merge(options)
      self.connection.call(
        "wp.getTaxonomies", 
        opts[:blog_id], 
        opts[:username],
        opts[:password]
      )
    end
    
    #http://codex.wordpress.org/XML-RPC_WordPress_API/Taxonomies#wp.getTerm
    def get_term(options = {})
      opts = {
        :blog_id => 0,
        :username => self.username,
        :password => self.password,
        :taxonomy => :category,
        :term_id  => 1
      }.merge(options)
      self.connection.call(
        "wp.getTerm", 
        opts[:blog_id], 
        opts[:username],
        opts[:password],
        opts[:taxonomy],
        opts[:term_id]
      )
    end
    
    #http://codex.wordpress.org/XML-RPC_WordPress_API/Taxonomies#wp.getTerms
    def get_terms(options = {})
      opts = {
        :blog_id => 0,
        :username => self.username,
        :password => self.password,
        :taxonomy => :category,
        :filter   => {}
      }.merge(options)
      self.connection.call(
        "wp.getTerms", 
        opts[:blog_id], 
        opts[:username],
        opts[:password],
        opts[:taxonomy],
        opts[:filter]
      )
    end
    
    #http://codex.wordpress.org/XML-RPC_WordPress_API/Taxonomies#wp.newTerm
    def new_term(options = {})
      opts = {
        :blog_id => 0,
        :username => self.username,
        :password => self.password,
        :content  => {
          :name         =>  'New Term',
          :taxonomy     =>  :category,
          :slug         =>  nil,
          :description  =>  nil,
          :parent       =>  nil
        }
      }.merge(options)
      self.connection.call(
        "wp.newTerm", 
        opts[:blog_id], 
        opts[:username],
        opts[:password],
        opts[:content]
      )
    end
    
    #http://codex.wordpress.org/XML-RPC_WordPress_API/Taxonomies#wp.editTerm
    def edit_term(options = {})
      opts = {
        :blog_id => 0,
        :username => self.username,
        :password => self.password,
        :term_id  => 1,
        :content  => {
          :name         =>  'Edited Term',
          :taxonomy     =>  :category,
          :slug         =>  nil,
          :description  =>  nil,
          :parent       =>  nil
        }
      }.merge(options)
      self.connection.call(
        "wp.editTerm", 
        opts[:blog_id], 
        opts[:username],
        opts[:password],
        opts[:term_id],
        opts[:content]
      )
    end
    
    #http://codex.wordpress.org/XML-RPC_WordPress_API/Taxonomies#wp.deleteTerm
    def delete_term(options = {})
      opts = {
        :blog_id => 0,
        :username => self.username,
        :password => self.password,
        :taxonomy => :category,
        :term_id  => nil
      }.merge(options)
      self.connection.call(
        "wp.deleteTerm",
        opts[:blog_id], 
        opts[:username],
        opts[:password],
        opts[:taxonomy],
        opts[:term_id]
      )
    end
    
  end
end