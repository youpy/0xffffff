require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Runner do
  before do
    @path = Pathname('/tmp/count.txt')
  end

  after do
    @path.unlink if @path.exist?
  end

  describe '#run' do
    it 'should run' do
      open(@path, 'w') do |f|
        f.write(123)
      end

      Uploader.should_receive(:new).and_return(uploader = mock)
      uploader.should_receive(:upload) do |*args|
        Pathname(args[0].path).should be_exist
      end

      Util.should_receive(:wait).with(1).and_raise('break')

      lambda {
        Runner.new(@path.to_s).run
      }.should raise_error('break')

      @path.read.chomp.should eql('124')
    end

    it 'should raise if count exceeds the max colors' do
      open(@path, 'w') do |f|
        f.write(0x1000000)
      end

      Uploader.should_receive(:new).and_return(uploader = mock)
      uploader.should_not_receive(:upload)

      lambda {
        Runner.new(@path.to_s).run
      }.should raise_error('finish!')
    end
  end
end
