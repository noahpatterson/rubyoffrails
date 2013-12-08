require 'rspec'
require '../../spec_helper'
require './blackjack'

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
		expect(card.to_s).to eq("A-Spades")
	end

	it "should be formatted nicely" do
		card = Card.new(:spades, '2')
		expect(card.to_s).to eq("2-Spades")
	end
end

describe Deck do
	it "should build 52 cards" do
		expect(Deck.build_cards.length).to eq(52)
	end

	it "should have 52 cards when new deck" do
		expect(Deck.new.cards.length).to eq(52)
	end
end

describe Game do 
	it "should have a players hand" do
		expect(Game.new.player_hand.cards.length).to eq(2)
	end

	it "should have a dealers hand" do
		expect(Game.new.dealer_hand.cards.length).to eq(2)
	end
	
	
	it "should have a status" do
		expect(Game.new.status).to_not be_nil
	end
end

describe Hand do
	it "should return status 5 for cards 2-hearts and 3-diamonds" do
		hand = Hand.new
		# hand.cards.concat([Card.new(:hearts,2),Card.new(:diamonds,3)])
		deck = double(:deck,:cards => [Card.new(:hearts,2),Card.new(:diamonds,3)])
		2.times { hand.hit!(deck) }
		expect(hand.value).to eq(5)
	end

	it "should have hit! give a random card from Deck" do
		deck = Deck.new
		hand = Hand.new
		hand.hit!(deck)
		expect(hand.cards.length).to eq(1)
	end

	it "should remove 1 card from the deck" do
		deck = Deck.new
		hand = Hand.new
		hand.hit!(deck)
		expect(deck.cards.length).to eq(51)
	end

	it "should remove the card that hand has from deck" do
		deck = Deck.new
		hand = Hand.new
		2.times {hand.hit!(deck)}
		expect(deck.cards.include?(hand.cards.each {|card|})).to eq(false)
	end

end