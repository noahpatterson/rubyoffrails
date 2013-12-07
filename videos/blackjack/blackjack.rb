
require 'rspec'
require '../../spec_helper'



class Card

	attr_reader :suit, :value

	def initialize(suit, value)
		@suit = suit
		@value = value
	end

	def value
		return 10 if %w(j q k).include?(@value)
		return 11 if @value == 'a'
		return @value
	end

	def to_s
		"#{@value}-#{@suit.capitalize}"
	end
end

class Deck

	def self.build_cards
		cards =[]
		[:clubs, :diamonds, :spades, :hearts].each do |suit|
			['j','q','k','a'].concat((2..10).to_a).each do |number|
				cards << Card.new(suit,number).to_s
				# cards << card.to_s
			end
		end
		cards
	end
end


describe Card do 
	it "should accept suit and value when building" do
		card = Card.new(:clubs,10)
		expect(card.suit).to eq(:clubs)
		expect(card.value).to eq(10)
	end

	it "should have a value of 10 for facecards" do
		%w(j q k).each {|facecard| card = Card.new(:hearts, facecard)
		expect(card.value).to eq(10)}
	end

	it "should have a value of 4 for the 4-clubs" do
		card = Card.new(:clubs, 4)
		expect(card.value).to eq(4)
	end

	it "should return 11 for Ace" do
		card = Card.new(:spades, 'a')
		expect(card.value).to eq(11)
	end

	it "should be formatted nicely" do
		card = Card.new(:spades, 'a')
		expect(card.to_s).to eq("a-Spades")
	end
end

describe Deck do
	it "should build 52 cards" do
		expect(Deck.build_cards.length).to eq(52)
	end

end
