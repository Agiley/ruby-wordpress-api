require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Post management using Rubypress" do
  
  before(:each) do
    @client       =   init_wp_admin_connection
    @post_data    =   {
      :post_author      =>  1,
      :post_type        =>  'post',
      :post_status      =>  'publish',
      :post_title       =>  'Test Post From RubyPress',
      :post_name        =>  'test-post-from-rubypress',
      :post_content     =>  "Just a test post from RubyPress...",
      :comment_status   =>  'closed',
      :ping_status      =>  'open',
      :terms            =>  {'category' => [1]}
    }
  end
  
  #Note that this will create a new post on the admin-blog specified in wordpress.yml everytime the specs run.
  it 'can create new blog posts successfully' do
    result = @client.new_post(:content => @post_data)
    result.class.should == String
    result.to_i.should be > 0 
  end
  
  it 'will fail to create a blog post due to an invalid category' do
    post_data = @post_data.merge(:terms => {'category' => [99999999]})
    expect { @client.new_post(:content => post_data) }.to raise_error(XMLRPC::FaultException)
  end
  
  it 'will fail to create a blog post due to an invalid tag' do
    post_data = @post_data.merge(:terms => {'post_tag' => [99999999]})
    expect { @client.new_post(:content => post_data) }.to raise_error(XMLRPC::FaultException)
  end
  
  it 'can edit a blog post successfully' do
    blog_post_id    =   @client.new_post(:content => @post_data).to_i
    post_data       =   @post_data.merge(:post_title => "Edited Test Post From RubyPress", :post_content => "This post has been edited!")
    response        =   @client.edit_post(:post_id => blog_post_id, :content => post_data)
    
    response.should == true
  end
  
  it 'can delete a blog post successfully' do
    post_data       =   @post_data.merge(:post_title => "Deleted Test Post From RubyPress", :post_content => "This post should not exist!")
    blog_post_id    =   @client.new_post(:content => post_data).to_i
    response        =   @client.delete_post(:post_id => blog_post_id)
    
    response.should == true
  end
  
  it 'can retrieve blog posts successfully' do
    result          =   @client.get_posts
    result.class.should == Array
    result.size.should be > 0
  end

end
