require 'rspec'
require './spec_helper'

# sum_squares = ->(num_list) {num_list.map {|num| num*num}.reduce(:+)}
sum = ->(num_list) {num_list.reduce(:+)}
square = ->(num) {num * num}
squares = ->(num_list) {num_list.map {|num| num*num}}
sum_squares = ->(num_list) {sum.(squares.(num_list))}
square_sum = ->(num_list)  {square.(sum.(num_list))}


describe "sum_squares" do
	it 'should  return 385 for sum of squares 1-10' do
		expect(sum_squares.(1..10)).to eq(385)
	end
end

describe "square_sum" do
	it 'should return 3025 for the square of sum of 1-10' do
		expect(square_sum.(1..10)).to eq(3025)
	end
end