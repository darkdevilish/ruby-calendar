require 'active_support/core_ext/date'
require 'active_support/core_ext/time'
require 'active_support/core_ext/array'
require_relative '../day_styles'

describe DayStyles do

  it "returns today" do
    today = DayStyles.new(Date.today).to_s

    expect(today).to eq("today")
  end

  it "returns future" do
    future = DayStyles.new(Time.now.days_since(2).to_date).to_s

    expect(future).to eq("future")
  end

  it "returns past" do
    past = DayStyles.new(Time.now.days_since(-2).to_date).to_s

    expect(past).to eq("past")
  end

  it "returns past other_month" do
    past_month = DayStyles.new(Time.now.months_since(-2).to_date).to_s

    expect(past_month).to eq("past other_month")
  end

  it "returns future other_month" do
    future_month = DayStyles.new(Time.now.months_since(2).to_date).to_s

    expect(future_month).to eq("future other_month")
  end

end
