require 'minitest/autorun'
require 'time'
require_relative '../lib/helpers/time_helper'

class TimeHelperTest < Minitest::Test
  include MegliHelper

  def test_change_timezone
    time = Time.now
    zone = TimeHelper.change_timezone(time, '+00:00').to_s.match(/(\+\d{4})/)[0]
    assert_equal zone, '+0000'

    zone = TimeHelper.change_timezone(time, '+03:00').to_s.match(/(\+\d{4})/)[0]
    assert_equal zone, '+0300'

    zone = TimeHelper.change_timezone(time, '-03:00').to_s.match(/(\-\d{4})/)[0]
    assert_equal zone, '-0300'
  end

  def test_format_date
    time = Time.now
    time_formatted = TimeHelper.format_date(time, '%Y')
    assert_equal time_formatted, time.year.to_s

    time_formatted = TimeHelper.format_date("26/05/2017 10:12:34", '%d-%m-%Y %Hh %Mmin %Ssec')
    assert_equal time_formatted, '26-05-2017 10h 12min 34sec'
  end

  def test_get_time
    time = TimeHelper.get_time
    time_parsed = Time.parse time
    assert_equal time_parsed.class, Time
  end

end
