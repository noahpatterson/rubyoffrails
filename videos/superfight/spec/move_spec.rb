require 'spec_helper'
require_relative '../lib/move'

describe Move do
  it 'can be a strike' do
    expect(Move.new(:strike).type).to eq(:strike)
  end

  it 'can be a block' do
    expect(Move.new(:block).type).to eq(:block)
  end

  it 'can have a ranking' do
    expect(1..100).to include(Move.new(double).ranking)
  end
end
