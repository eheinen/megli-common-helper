require 'minitest/autorun'
require 'time'
require_relative '../lib/helpers/assert_helper'

class AssertHelperTest < Minitest::Test
  include MegliHelper

  def test_assert_time_range
    first_time = Time.now
    second_time = first_time + 120
    AssertHelper.assert_time_range(first_time, second_time, 2, 2)

    assert_raises do
      AssertHelper.assert_time_range(first_time, second_time, 1, 1)
    end
  end
end
