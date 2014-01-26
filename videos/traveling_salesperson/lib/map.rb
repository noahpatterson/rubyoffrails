require 'geocoder'

class Map

  def self.search(text)
    Geocoder.search(text).first
  end

  def self.distance_between(start_point, end_point)
    Geocoder::Calculations.distance_between(start_point,end_point)
  end
end