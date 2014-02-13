# encoding: UTF-8

$LOAD_PATH.unshift(File.dirname(__FILE__)) unless $LOAD_PATH.include?(File.dirname(__FILE__))

require 'xmlrpc/client'
require 'rubypress/xmlrpc_extension'

require 'rubypress/posts'
require 'rubypress/taxonomies'
require 'rubypress/media'
require 'rubypress/comments'
require 'rubypress/options'
require 'rubypress/themes'
require 'rubypress/users'
require 'rubypress/custom'

require 'rubypress/client'