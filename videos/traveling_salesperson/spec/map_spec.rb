require 'spec_helper'
require_relative '../lib/map'
require 'geocoder'

describe Map do

  describe ":search" do
    it "should delegate search to geocoder" do
      Geocoder.should_receive(:search).with("austin, tx").and_return([])
      Map.search("austin, tx")
    end

    it "should use the first item in the search array" do
      austin = double("Austin")
      dallas = double("Dallas")
      Geocoder.stub(:search) {[austin,dallas]}
      expect(Map.search("austin, tx")).to eq(austin)
    end
    
  end

  describe ":distance" do
    it "should calculate distance between two sets of coordinates" do
      alpha = double('alpha')
      beta = double('beta')
      Geocoder::Calculations.should_receive(:distance_between).with(alpha,beta)
      Map.distance_between(alpha, beta)
    end
  end

  it "should create a place from a name" do
    
  end
end