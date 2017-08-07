require 'time'

module MegliHelper
  class AssertHelper
    # Assert a range of time according to min and max range
    # @param time to be compared
    # @param time_base to be a base in the comparison
    # @param min_range to decrease the base time
    # @param max_range to increase the base time
    # If time is not inside the ranges, then it will raise an exception to fail the test.
    def self.assert_time_range(time, time_base, min_range, max_range)
      time = Time.parse(time) if time.class == String
      time_base = Time.parse(time_base) if time_base.class == String
      time_base ||= Time.now
      min = (time_base - 60 * min_range)
      max = (time_base + 60 * max_range)
      raise("The time #{time} is not inside the range #{min} and #{max}") if time < min || time > max
      true
    end
  end
end
