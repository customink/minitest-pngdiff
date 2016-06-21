require 'test_helper'

class PngInputTest < TestCase
  def test_png_file_path_input
    png1 = comparison_png(0)
    png2 = comparison_png(0)
    assert_png_equal(png1, png2)
  end

  def test_png_blob_input
    png1 = File.read(comparison_png(0))
    png2 = File.read(comparison_png(0))
    assert_png_equal(png1, png2)
  end

  def test_io_object_input
    png1 = File.open(comparison_png(0))
    png2 = File.open(comparison_png(0))
    assert_png_equal(png1, png2)
  end
end
