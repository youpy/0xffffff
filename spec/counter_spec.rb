require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Counter do
  before do
    @path = Pathname('/tmp/count.txt')
  end

  after do
    @path.unlink if @path.exist?
  end

  describe '#count_up' do
    it 'should count up' do
      open(@path, 'w') do |f|
        f.write(123)
      end

      x = 0;

      counter = Counter.new(@path.to_s)
      counter.count_up do |count|
        x = count
      end

      x.should eql(123)

      open(@path) do |f|
        f.read.chomp.to_i.should eql(124)
      end
    end

    it 'should count up even if file does not exist' do
      x = 0;

      counter = Counter.new(@path.to_s)
      counter.count_up do |count|
        x = count
      end

      x.should eql(0)

      open(@path) do |f|
        f.read.chomp.to_i.should eql(1)
      end
    end
  end
end
