require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Taxonomy management using Rubypress" do
  
  before(:each) do
    @client       =   init_wp_admin_connection
  end
  
  it 'can retrieve taxonomies successfully' do
    result = @client.get_taxonomies
    result.class.should == Array
    result.size.should be > 0
  end
  
  it 'can retrieve a specific term successfully' do
    result = @client.get_term(:taxonomy => :category, :term_id => 1)
    result.class.should == Hash
    result.keys.size.should be > 0
  end
  
  it 'can retrieve a specific term successfully' do
    result = @client.get_terms(:taxonomy => :category)
    result.class.should == Array
    result.size.should be > 0
  end
  
  it 'can create a new term successfully' do
    term_content = {:name => 'New Category created by RubyPress', :taxonomy => :category, :description => 'A new category created by RubyPress'}
    result = @client.new_term(:content => term_content)
    result.class.should == String
    result.to_i.should be > 0
  end
  
  it 'can edit a term successfully' do
    term_content  =   {:name => 'Yet Another Category created by RubyPress', :taxonomy => :category, :description => 'Yet Another Category that has been created via RubyPress'}
    term_id       =   @client.new_term(:content => term_content).to_i
    term_content  =   {:name => 'Edited Category via RubyPress', :taxonomy => :category, :description => 'A category that has been edited via RubyPress', :slug => 'edited-category-via-rubypress'}
    result        =   @client.edit_term(:term_id => term_id, :content => term_content)
    
    result.should == true
  end
  
  it 'can delete a term successfully' do
    term_content  =   {:name => 'Deleted Term', :taxonomy => :category, :description => 'A term that should have been deleted RubyPress'}
    term_id       =   @client.new_term(:content => term_content).to_i
    result        =   @client.delete_term(:taxonomy => :category, :term_id => term_id)
    
    result.should == true
  end

end
