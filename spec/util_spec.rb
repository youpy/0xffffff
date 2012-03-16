require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Util do
  describe '.create_image' do
    it 'should create image' do
      proc_is_called = false
      path = nil

      Util.create_image(100, 200, 0x00ff00) do |file|
        proc_is_called = true
        path = file.path
        png = ChunkyPNG::Image.from_file(file.path)
        png.should be_a_kind_of(ChunkyPNG::Image)
        png[0, 0].should eql(0x00ff00ff)
        png[99, 199].should eql(0x00ff00ff)

        lambda {
          png[99, 200]
        }.should raise_error(ChunkyPNG::OutOfBounds)
      end

      proc_is_called.should be_true
      Pathname(path).should_not be_exist
    end
  end
end
