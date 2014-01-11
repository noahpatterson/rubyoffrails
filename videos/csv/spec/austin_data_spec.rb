# Our Spec File starting point
require "./austin-data"
require "../../spec_helper"

describe ImportsData do 
	it "should have 366 entries" do
	  expect(ImportsData.new.import.count).to eq(366)
	end

   it "should return a weathMeasurement" do
     expect(ImportsData.new.import.first).to be_a(WeatherMeasurement)
   end

   it "should have the right measurements for nov 28" do
     measurements = ImportsData.new.import
     nov_28 = measurements.select{ |measurement| measurement if measurement.date == Date.parse("2011-11-28")}.first
     print nov_28.temperature
     expect(nov_28.temperature).to eq(63)
     expect(nov_28.rain).to eq(0.00)
   end
end

describe WeatherMeasurement do
   let(:weather_data) {{"PrecipitationIn" => "0.10","Max TemperatureF" => 95, "CDT" => "2011-3-28"}}

   it "should fetch the rain and store it" do
      expect(WeatherMeasurement.new(weather_data).rain).to eq(0.10)
   end
   it "should fetch the temperature and store it" do
      expect(WeatherMeasurement.new(weather_data).temperature).to eq(95)
   end
   it "fetch the date and stores it" do
      expect(WeatherMeasurement.new(weather_data).date).to eq(Date.parse("2011-3-28"))
   end
end

describe WeatherChart do
   let(:measurements) { [double({:rain => 0.0, :temperature => 64, :date => Date.parse("2011-11-28")})]}
   it "should create an array of data points" do
     expect(WeatherChart.new.create(measurements)).to include("['Nov28', 0.0, 64]")
   end
   
   it "should get the template" do
     expect(WeatherChart.new.create(measurements)).to include("google.visualization.LineChart")
   end

   let(:file_path) {"/tmp/austin_chart.html"}
   let(:fake_html) {"fake-html"}
   it "should write to a file" do
      chart = WeatherChart.new
      chart.stub(:create) {fake_html}
      file_mock = double("file")
      file_mock.stub(:write).with(fake_html)
      File.should_receive(:open).with(file_path, "w") {file_mock}
      chart.create_to_file(file_path,measurements)
   end
end