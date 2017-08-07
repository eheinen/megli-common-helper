require 'time'

module MegliHelper
  class TimeHelper
    # Change timezone of a time passed
    # @param time [Time][String] time to be changed
    # @param timezone [String] timezone to be set in the time
    # @return [Time] time with a new timezone
    def self.change_timezone(time, timezone = '+00:00')
      time = Time.parse(time) if time.class == String
      time.localtime(timezone)
    end

    # Get time now with addinional minutes and convert it to format passed
    # @param format [Symbol] time format. Default value: :iso8601
    # @param add_minutes [Integer] quantity of minutes to sum
    # @return [String] time formatted
    def self.get_time(format = :iso8601, add_minutes = 0)
      return nil if add_minutes.nil?
      add_minutes = add_minutes.to_i if add_minutes.class == String
      time = Time.now + (60 * add_minutes)
      unless format.nil?
        time = time.iso8601 if format == :iso8601
        time = time.utc if format == :utc
        time = time.rfc822 if format == :rfc822 || format == :rfc2822
        time = time.ctime if format == :ctime
      end
      time
    end
  end
end
