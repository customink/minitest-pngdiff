require 'minitest/unit'
require 'pngdiff/assertions'

if defined?(Minitest::Test)
  Minitest::Test.include Pngdiff::Assertions
else
  MiniTest::Unit::TestCase.include Pngdiff::Assertions
end
