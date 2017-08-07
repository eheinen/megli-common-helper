require 'minitest/autorun'
require 'time'
require_relative '../lib/helpers/common_helper'

class CommonHelperTest < Minitest::Test
  include MegliHelper

  def test_nil_or_empty
    assert_equal true, CommonHelper.nil_or_empty?(nil)
    assert_equal true, CommonHelper.nil_or_empty?('')
    assert_equal true, CommonHelper.nil_or_empty?([])
    assert_equal true, CommonHelper.nil_or_empty?({})

    assert_equal false, CommonHelper.nil_or_empty?(1)
    assert_equal false, CommonHelper.nil_or_empty?(true)
    assert_equal false, CommonHelper.nil_or_empty?('a')
    assert_equal false, CommonHelper.nil_or_empty?([1])
    assert_equal false, CommonHelper.nil_or_empty?({ a: 'a' })
  end

  def test_to_boolean
    assert_equal true, CommonHelper.to_boolean(1)
    assert_equal true, CommonHelper.to_boolean(true)
    assert_equal true, CommonHelper.to_boolean('1')
    assert_equal true, CommonHelper.to_boolean('true')
    assert_equal true, CommonHelper.to_boolean('yes')
    assert_equal true, CommonHelper.to_boolean('y')

    assert_equal false, CommonHelper.to_boolean(0)
    assert_equal false, CommonHelper.to_boolean(false)
    assert_equal false, CommonHelper.to_boolean('0')
    assert_equal false, CommonHelper.to_boolean('false')
    assert_equal false, CommonHelper.to_boolean('no')
    assert_equal false, CommonHelper.to_boolean('n')
    assert_equal false, CommonHelper.to_boolean(nil)
    assert_equal false, CommonHelper.to_boolean('')
  end

  def test_to_decimal
    assert_equal "200.12", CommonHelper.to_decimal(200.123)
    assert_equal "$200.12", CommonHelper.to_decimal(200.123, '%8.2f', '$')
    assert_equal "200.12$", CommonHelper.to_decimal(200.123, '%8.2f', '$', false)
    assert_equal "200.123", CommonHelper.to_decimal(200.123, '%8.3f')
  end

  def test_valid_json
    assert_equal true, CommonHelper.valid_json?('{}')
    assert_equal true, CommonHelper.valid_json?('{ "a": 1, "b": 2 }')
    assert_equal true, CommonHelper.valid_json?('{ "a": [ 1, 2 ] }')

    assert_equal false, CommonHelper.valid_json?('')
    assert_equal false, CommonHelper.valid_json?('{ [ 1, 2 ] }')
    assert_equal false, CommonHelper.valid_json?('{ a: 1, b: 2 }')
    assert_equal false, CommonHelper.valid_json?(nil)
    assert_equal false, CommonHelper.valid_json?({})
    assert_equal false, CommonHelper.valid_json?(1)
  end

  def test_wait_until_condition
    time = Time.now + 2
    CommonHelper.wait_until_condition -> { Time.now > time }
    assert_equal time < Time.now, true
  end

end
