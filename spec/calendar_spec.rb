require_relative '../calendar'

describe Calendar do
  
  before do
    @calendar = map_calendar(Date.today)
    @future_calendar = map_calendar(Time.now.months_since(2).to_date)
  end

  it "returns a calendar of current month" do
    calendar = Calendar.new.to_a

    expect(calendar).to eq(@calendar)
  end

  it "returns a calendar passsing a date object" do
    calendar = Calendar.new(Time.now.months_since(2).to_date).to_a

    expect(calendar).to eq(@future_calendar)
  end

private

  def map_calendar(date)
    CalendarMonthWeeks.new(date).to_a.map do |week|
      week.map do |date|
        [date, DayStyles.new(date).to_s]
      end
    end
  end

end
