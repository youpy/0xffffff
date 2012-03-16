require 'pathname'
require 'tempfile'
require 'flickraw'
require 'chunky_png'
require 'logger'

FlickRaw.api_key = 'accf136891b91047e61bd08ca84a4ee6'
FlickRaw.shared_secret = 'cdc468e584605aea'

module FFFFFF
  IMAGE_WIDTH = 640
  IMAGE_HEIGHT = 480

  class Counter
    def initialize(path)
      @path = Pathname(path)
    end

    def count_up
      count = read
      count += 1

      yield count

      write(count)
    end

    private

    def read
      if @path.exist?
        @path.read.chomp.to_i
      else
        0
      end
    end

    def write(count)
      open(@path, 'w') do |f|
        f.write count.to_s
      end
    end
  end

  class Util
    class << self
      def wait(sec)
        sleep(sec)
      end

      def create_image(width, height, color)
        png = ChunkyPNG::Image.new(width, height)
        color = ChunkyPNG::Color.from_hex('#' + color.to_s(16).rjust(6, '0'))

        width.times do |w|
          height.times do |h|
            png[w, h] = color
          end
        end

        tempfile = Tempfile.new("image")
        png.save(tempfile.path)

        yield tempfile

        tempfile.unlink
      end
    end
  end

  class Uploader
    def upload(path)
      flickr.upload_photo path, :title => 'image'
    end
  end

  class Runner
    def initialize(path)
      @logger = Logger.new(STDOUT)
      @path = path
    end

    def run
      counter = Counter.new(@path)
      uploader = Uploader.new

      loop do
        counter.count_up do |count|
          raise "finish!" if count > 0xffffff

          Util.create_image(IMAGE_WIDTH, IMAGE_HEIGHT, count) do |path|
            uploader.upload(path)
          end

          @logger.info('upload #%i' % count)
        end

        Util.wait(1)
      end
    end
  end
end
