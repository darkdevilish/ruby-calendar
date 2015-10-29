require 'active_support/core_ext/date'
require 'active_support/core_ext/time'
require 'active_support/core_ext/array'
require '../calendar_month_weeks'

describe CalendarMonthWeeks do
  before do
    first_calendar_day = Date.today.beginning_of_month.beginning_of_week(:sunday)
    last_calendar_day = Date.today.end_of_month.end_of_week(:sunday)
    @starting_date = Time.now.months_since(2).to_date
    first_starting_date_day = @starting_date.beginning_of_month.beginning_of_week(:sunday)
    last_starting_date_day = @starting_date.end_of_month.end_of_week(:sunday)
    @month_weeks = (first_calendar_day..last_calendar_day).to_a.in_groups_of(7)
    @starting_date_month_weeks = (first_starting_date_day..last_starting_date_day).to_a.in_groups_of(7)
  end

  it "returns array with weeks of month without passing any date object" do
    month_weeks = CalendarMonthWeeks.new.to_a

    expect(@month_weeks).to eq(month_weeks)
  end

  it "returns array with weeks of month passing a date object" do
    month_weeks = CalendarMonthWeeks.new(@starting_date).to_a

    expect(@starting_date_month_weeks).to eq(month_weeks)
  end

end
