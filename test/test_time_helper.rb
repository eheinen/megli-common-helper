require 'minitest/autorun'
require 'time'
require_relative '../lib/helpers/time_helper'

class TimeHelperTest < Minitest::Test
  include MegliHelper

  def test_get_time
    time =  TimeHelper.get_time
    time_parsed = Time.parse time
    assert_equal time_parsed.class, Time
  end

  def test_change_timezone
    time = Time.now
    zone = TimeHelper.change_timezone(time, '+00:00').to_s.match(/(\+\d{4})/)[0]
    assert_equal zone, '+0000'

    zone = TimeHelper.change_timezone(time, '+03:00').to_s.match(/(\+\d{4})/)[0]
    assert_equal zone, '+0300'

    zone = TimeHelper.change_timezone(time, '-03:00').to_s.match(/(\-\d{4})/)[0]
    assert_equal zone, '-0300'
  end
end
