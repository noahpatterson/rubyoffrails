# a fighter
class Fighter
  attr_reader :strike, :block, :name
  def initialize(name)
    @strike = Move.new(:strike)
    @block = Move.new(:block)
    @name = name
  end
end
