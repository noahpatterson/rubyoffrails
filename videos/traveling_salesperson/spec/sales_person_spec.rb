require 'spec_helper'
require_relative '../lib/sales_person'
require_relative '../lib/place'
require_relative '../lib/calculates_route'

describe SalesPerson do
  it "should have many cities" do
    city = double
    subject.schedule_city(city)
    expect(subject.cities).to include(city)
  end

  it "should only schedule a city once" do
    city = double
    expect{
      subject.schedule_city(city)
      subject.schedule_city(city)
    }.to change(subject.cities, :count).by(1)

    #would fail if ever cities had a default city
    # subject.schedule_city(city)
    # subject.schedule_city(city)
    # subject.cities.should eq([city])
  end
  
  it "shoudl calculate a route via CalculatesRoute" do
    cities = [double, double, double]
    subject.stub(:cities) {cities}
    CalculatesRoute.should_receive(:calculate).with(cities)
    subject.route
  end

  it "should return the route from CalculatesRoute" do
    route_stub = [double, double]
    CalculatesRoute.stub(:calculate) { route_stub }
    expect(subject.route).to eq(route_stub)
  end

  xit "should log total miles" do
    
  end
end