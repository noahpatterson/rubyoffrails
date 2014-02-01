require 'spec_helper'
require_relative '../lib/turn'

describe 'Turn' do
  let(:strike_a) { Move.new(:strike)  }
  let(:strike_b) { Move.new(:strike)  }

  it 'should have a winner' do
    expect([strike_a, strike_b]).to include(Turn.new(strike_a, strike_b).winner)
  end
end
