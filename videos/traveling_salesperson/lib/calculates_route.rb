require_relative 'map'

class CalculatesRoute

  def self.convert_to_points(places)
    places.map { |place| place.coordinates  }
  end

  def self.calculate(points)
    remaining_points = points
    route = remaining_points.shift(1)
    until remaining_points.length == 1 do
      next_point = shortest_distance(route.last,remaining_points)
      remaining_points.delete(next_point)
      route << next_point
    end
    route << remaining_points.last
  end

  def self.shortest_distance(from, possible)
    possible.sort { |a,b|  Map.distance_between(from.coordinates, a.coordinates) <=> Map.distance_between(from.coordinates, b.coordinates)}.first
  end
end