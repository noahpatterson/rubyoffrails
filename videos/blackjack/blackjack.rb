
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
		"#{@value.is_a?(String) ? @value.capitalize : @value}-#{@suit.capitalize}"
	end
end

class Deck
	attr_reader :cards

	def initialize
		@cards = Deck.build_cards
	end

	def self.build_cards
		cards =[]
		[:clubs, :diamonds, :spades, :hearts].each do |suit|
			['j','q','k','a'].concat((2..10).to_a).each do |number|
				cards << Card.new(suit,number)
			end
		end
		cards.shuffle
	end
end

class Game
	attr_reader :player_hand, :dealer_hand
	def initialize
		@deck = Deck.new
		@player_hand = Hand.new
		@dealer_hand = Hand.new
		2.times {@player_hand.hit!(@deck)}
		2.times {@dealer_hand.hit!(@deck)}
	end

	def status
		{:player_card => @player_hand.cards,
		 :player_value => @player_hand.value,
		 :dealer_card => @dealer_hand.cards,
		 :dealer_value => @dealer_hand.value
		}
	end
end


class Hand

	attr_reader :cards
	def initialize
		@cards = []
	end

	def hit!(deck)
		@cards << deck.cards.pop
	end

	def value 
		value = 0
		@cards.each do |card|
			value += card.value
		end
		value
	end

end


