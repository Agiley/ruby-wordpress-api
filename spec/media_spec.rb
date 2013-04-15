require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Media Management using Rubypress" do
  
  before(:each) do
    @client       =   init_wp_admin_connection
  end
    
  it 'can upload files successfully' do
    file_path     =   File.expand_path(File.dirname(__FILE__) + '/files/peter_griffin.png')
    file          =   File.open(file_path, "rb")
    file_name     =   File.basename(file_path)
    
    data          =   {
      name:         file_name,
      type:         'image/png',
      bits:         file.read,
      overwrite:    false
    }
    
    result        =   @client.upload_file(data: data)
    
    result.class.should == Hash
    result.size.should be > 0
    result["file"].should == file_name
  end

end
