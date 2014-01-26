require 'spec_helper'
require_relative '../lib/place'
require_relative '../lib/map'


describe Place do
  it "should have a name" do
    expect(subject).to respond_to(:name)
  end

  it "should have a coordinate" do
    subject.coordinates = [29, -95]
    expect(subject.coordinates).to eq([29, -95])  
  end

  describe "#to_s" do
    it "should print the place nicely" do
      subject.stub(:name) {"Boston"}
      expect(subject.to_s).to eq("Boston")
    end
  end

  

  describe ":build" do

    let(:name) {"El Paso, TX"}
    let(:result) {double("el paso", coordinates: [29,-95])}

    it "should build form the map" do
      Map.should_receive(:search).with(name).and_return(result)
      Place.build(name)
    end

    it "should be a place" do
      Map.stub(:search).with(name).and_return(result)
      expect(Place.build(name)).to be_a(Place)
    end
  end

  describe "#to_coordinates" do
    it "shoudl delegate to_coordinates to coordinates" do
      subject.stub(:coordinates) {[5,5]}
      expect(subject.to_coordinates).to eq([5,5])
    end
  end

  
end