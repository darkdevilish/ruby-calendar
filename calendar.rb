require 'active_support/core_ext/date'
require 'active_support/core_ext/time'
require 'active_support/core_ext/array'
require 'calendar_month_weeks'
require 'day_styles'

class Calendar
  def initialize(date=Date.today)
   @date = date
  end

  def to_a
    CalendarMonthWeeks.new(@date).to_a.map do |week|
      week.map do |date|
        [date, DayStyles.new(date).to_s]
      end
    end
  end

end
