require 'test_helper'

class Minitest::Pngdiff::AssertionsTest < Minitest::Test
  def setup
    black = ChunkyPNG::Color::PREDEFINED_COLORS[:black]
    white = ChunkyPNG::Color::PREDEFINED_COLORS[:white]
    @black_white_distance = ChunkyPNG::Color.euclidean_distance_rgba(black, white)
  end

  def test_assert_png_diff_with_same_image
    assert_png_diff(comparison_png(0), comparison_png(0), 0)
  end

  def test_assert_png_diff_with_1_percent_difference
    assert_png_diff(comparison_png(0), comparison_png(1),
      @black_white_distance * 0.01)
  end

  def test_assert_png_diff_with_10_percent_difference
    assert_png_diff(comparison_png(0), comparison_png(10),
      @black_white_distance * 0.1)
  end

  def test_assert_png_diff_with_50_percent_difference
    assert_png_diff(comparison_png(0), comparison_png(50),
      @black_white_distance / 2)
  end

  def test_assert_png_diff_with_100_percent_difference
    assert_png_diff(comparison_png(0), comparison_png(100),
      @black_white_distance)
  end

  # def test_refute_png_diff_with_same_image
    # refute_png_diff(comparison_png(0), comparison_png(0), 0)
  # end

  def test_refute_png_diff_with_1_percent_difference
    refute_png_diff(comparison_png(0), comparison_png(1), @black_white_distance * 0.01)
  end

  def test_refute_png_diff_with_10_percent_difference
    refute_png_diff(comparison_png(0), comparison_png(10), @black_white_distance * 0.1)
  end

  # def test_refute_png_diff_with_50_percent_difference
    # refute_png_diff(comparison_png(0), comparison_png(50), @black_white_distance / 2)
  # end

  def test_assert_png_equal_with_same_image
    assert_png_equal(comparison_png(0), comparison_png(0))
  end

  # def test_assert_png_equal_with_different_image
    # assert_png_equal(comparison_png(0), comparison_png(1))
  # end

  # def test_refute_png_equal_with_same_image
    # refute_png_equal(comparison_png(0), comparison_png(0))
  # end

  def test_refute_png_equal_with_different_image
    refute_png_equal(comparison_png(0), comparison_png(1))
  end
end
