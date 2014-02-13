# encoding: UTF-8

module Rubypress
  class Client
    attr_reader :connection
    attr_accessor :port, :host, :path, :username, :password, :use_ssl
    attr_accessor :timeout, :verbose
    attr_accessor :default_post_fields
    
    def initialize(options = {})
      opts = {
        :host                 =>  nil,
        :port                 =>  80,
        :use_ssl              =>  true,
        :path                 =>  '/xmlrpc.php',
        :username             =>  nil,
        :password             =>  nil,
        :default_post_fields  =>  ['post', 'terms', 'custom_fields'],
        :timeout              =>  30,
        :verbose              =>  false
      }.merge(options)
      
      self.host                 =   opts[:host]
      self.port                 =   opts[:port]
      self.path                 =   opts[:path]
      self.username             =   opts[:username]
      self.password             =   opts[:password]
      self.use_ssl              =   opts[:use_ssl]
      self.default_post_fields  =   opts[:default_post_fields]
      self.timeout              =   opts[:timeout]
      self.verbose              =   opts[:verbose]
      self.connect
      
      self
    end

    def connect
      @connection                     =   XMLRPC::Client.new(self.host, self.path, self.port, nil, nil, nil, nil, self.use_ssl, self.timeout)
      @connection.http_header_extra   =   {"accept-encoding" => "identity"} #Fix for RuntimeError: Wrong size.
      @connection.set_debug if @connection.respond_to?(:set_debug) && self.verbose
    end
    
    include Rubypress::Posts
    include Rubypress::Taxonomies
    include Rubypress::Media
    include Rubypress::Comments
    include Rubypress::Options
    include Rubypress::Users
    include Rubypress::Custom

  end
end