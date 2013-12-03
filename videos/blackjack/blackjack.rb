class Card
	def value
		5
	end
end

describle Card do 
	it "should have a value of 6" do
		# Card.new.value.should eq(6)
		value = Card.new
		value.value eq(6)
end