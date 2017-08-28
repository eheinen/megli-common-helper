require 'minitest/autorun'
require_relative '../lib/ext/string'

class StringTest < Minitest::Test

  def test_underscore
    assert_equal 'testUnderscore'.underscore, 'test_underscore'
    assert_equal 'test-Underscore'.underscore, 'test_underscore'
    assert_equal 'test Underscore'.underscore, 'test_underscore'
    assert_equal 'TEST Underscore'.underscore, 'test_underscore'
  end

end
