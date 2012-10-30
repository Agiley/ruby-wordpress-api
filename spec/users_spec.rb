require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "User management using Rubypress" do
  
  before(:each) do
    @client       =   init_wp_admin_connection
  end
  
  it 'can retrieve all blogs for the current api user' do
    result = @client.get_users_blogs
    result.class.should == Array
    result.size.should be > 0
  end

end
