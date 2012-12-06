require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Comment management using Rubypress" do
  
  before(:each) do
    @client       =   init_wp_admin_connection
  end
    
  it 'can retrieve comments successfully' do
    result        =   @client.get_comments
    
    result.class.should == Array
    result.size.should be > 0
  end

end
