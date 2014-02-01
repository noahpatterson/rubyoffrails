# a turn for the fighters
class Turn
  attr_reader :winner
  def initialize(move_a, move_b)
    @move_a = move_a
    @move_b = move_b
    @winner = determine_winner
  end

  private

  def determine_winner
    [@move_b, @move_a].sample
  end
end
