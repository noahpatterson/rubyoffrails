require '../../spec_helper'


class Card

	attr_reader :suit, :value

	def initialize(suit, value)
		@suit = suit
		@value = value
	end


end

describe Card do 
	it "should accept suit and value when building" do
		card = Card.new(:clubs,10)
		expect(card.suit).to eq(:clubs)
		expect(card.value).to eq(10)
	end
end