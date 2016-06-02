require 'chunky_png'
require 'oily_png'

require 'minitest/pngdiff/methods/distance'

module Minitest
  module Assertions

    # png1 and png2 can be IO streams, a filename string,
    # or string blob representing the PNG data
    def assert_png_diff(png1, png2, threshold, diff_method: :distance, msg: nil)
      diff = compare_images(png1, png2, diff_method)
      changed = diff.select{|d| d != 0}
      difference = (changed.inject(0.0, :+) / diff.length)
      msg ||= "Expected PNGs to have a distance of less than #{threshold} but was #{difference}"
      assert  difference <= threshold, msg
    end

    # png1 and png2 can be IO streams, a filename string,
    # or string blob representing the PNG data
    def refute_png_diff(png1, png2, threshold, diff_method: :distance, msg: nil)
      diff = compare_images(png1, png2, diff_method)
      changed = diff.select{|d| d != 0}
      difference = (changed.inject(0.0, :+) / diff.length)
      msg ||= "Expected PNGs to have a distance of greater than #{threshold} but was #{difference}"
      refute difference < threshold, msg
    end

    def assert_png_equal(png1, png2, diff_method: :distance, msg: nil)
      assert_png_diff(png1, png2, 0.0, diff_method: diff_method, msg: msg)
    end

    def refute_png_equal(png1, png2, diff_method: :distance, msg: nil)
      refute_png_diff(png1, png2, 0.0, diff_method: diff_method, msg: msg)
    end

    private
    def compare_images(png1, png2, diff_method)
      png1 = build_chunky_png_image(png1)
      png2 = build_chunky_png_image(png2)
      differ = build_differ(diff_method)

      diff = []
      png1.height.times do |y|
        png1.row(y).each_with_index do |pixel1, x|
          pixel2 = png2[x, y]
          diff << differ.calc_difference(pixel1, pixel2)
        end
      end
      diff
    end

    def build_differ(diff_method)
      Object.const_get("Minitest::Pngdiff::Methods::#{diff_method.capitalize}").new
    end

    def build_chunky_png_image(png)
      input_type = determine_png_input_type(png)
      ChunkyPNG::Image.send(input_type, png)
    end

    def determine_png_input_type(png)
      type = :from_io
      if (png.is_a? String)
        if (png[-3..-1] == 'png')
          type = :from_file
        else
          type = :from_blob
        end
      end
      type
    end
  end
end
