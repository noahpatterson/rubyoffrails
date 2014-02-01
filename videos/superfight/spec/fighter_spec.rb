require 'spec_helper'
require_relative '../lib/fighter'

describe Fighter do
  subject { Fighter.new('Mike Tyson') }

  it 'should have a strike' do
    expect(subject.strike).to be_a(Move)
  end

  it 'should have a block' do
    expect(subject.block).to be_a(Move)
  end

  it 'should have a name' do
    expect(subject.name).to eq('Mike Tyson')
  end

  xit 'should randomly select a move' do
    expect(subject.random_move).to be_a(Move)
  end
end
