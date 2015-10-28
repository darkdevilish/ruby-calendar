require 'active_support/core_ext/date'
require 'active_support/core_ext/time'
require 'active_support/core_ext/array'

class CalendarMonthsWeeks
  def initialize(date=Date.today)
    @date = date
  end

  def to_a
    first_calendar_day = Date.today.beginning_of_month.beginning_of_week(:sunday)
    last_calendar_day = Date.today.end_of_month.end_of_week(:sunday)

    (first_calendar_day..last_calendar_day).to_a.in_groups_of(7)
  end
end
