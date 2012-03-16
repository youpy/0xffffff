require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Uploader do
  describe '#upload' do
    it 'should upload image to flickr' do
      flickr.should_receive(:upload_photo).with('/path/to/file', :title => 'image')

      uploader = Uploader.new
      uploader.upload('/path/to/file')
    end
  end
end
