
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

	def inspect
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
	attr_reader :player_hand, :dealer_hand, :status
	def initialize
		@deck = Deck.new
		@player_hand = Hand.new
		@dealer_hand = Hand.new
		2.times {@player_hand.hit!(@deck)}
		2.times {@dealer_hand.hit!(@deck)}
	end

	def hit
		@player_hand.hit!(@deck)
		inspect
		# if @player_hand.value > 21
		# 	determine_winner(@player_hand.value,@dealer_hand.value)
		# end
	end

	def stand
		@dealer_hand.play_as_dealer(@deck)
		@winner = determine_winner(@player_hand.value,@dealer_hand.value)
		@winner.to_s + "! " + inspect + " Dealer Hand: #{@dealer_hand.cards.each {|card| card}}, Value: #{@dealer_hand.value}"
	end

	

	def determine_winner(player_value,dealer_value)
		return :dealer if player_value > 21
		return :player if dealer_value > 21
		if player_value == dealer_value
			:push
		elsif player_value > dealer_value
			:player
		else
			:dealer
		end
	end

	def inspect
		cards = @player_hand.cards
		"Player Hand: #{cards.each {|card| card}}, value: #{@player_hand.value}"
	end

	private

	def status
		{:player_card => @player_hand.cards,
		 :player_value => @player_hand.value,
		 :dealer_card => @dealer_hand.cards,
		 :dealer_value => @dealer_hand.value,
		 :winner => @winner
		}
	end
end


class Hand

	attr_reader :cards
	def initialize
		@cards = []
	end

	def hit!(deck)
		@cards << deck.cards.shift
	end

	def value 
		cards.inject(0){ |sum, card| sum += card.value }
	end

	def play_as_dealer(deck)
		if value < 16
			hit!(deck)
			play_as_dealer(deck)
		end
	end


end


