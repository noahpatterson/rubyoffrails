# a move for fighters
class Move
  attr_reader :type, :ranking
  def initialize(type)
    @type = type
    @ranking = rand(100)
  end
end
