require 'minitest/autorun'
require 'minitest/pngdiff'

def comparison_png(percent)
  "test/support/#{percent}_percent_black.png"
end

if defined?(Minitest::Test)
  class TestCase < Minitest::Test; end
else
  class TestCase < MiniTest::Unit::TestCase; end
end
