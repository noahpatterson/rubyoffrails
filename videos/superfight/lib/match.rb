# a match between fightrers
class Match
  attr_reader :opponents, :winner, :turns
  def initialize(fighter_name_1, fighter_name_2)
    @opponents = [fighter_name_1, fighter_name_2]
    @turns = build_turns
  end

  def winner
    if winner_count_for_opponent(@opponents[0]) > winner_count_for_opponent(@opponents[1])
      @opponents[0]
    else
      @opponents[1]
    end
  end

  def winner_count_for_opponent(opponent)
    @turns.select { |opponent_find| opponent_find == opponent.strike }.count
  end

  private

  def build_turns
    13.times.map do
      Turn.new(@opponents[0].strike, @opponents[1].strike).winner
    end
  end


end
